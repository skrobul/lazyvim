return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "yaml" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
      version = false, -- last release is way too old
    },
    opts = {
      setup = {
        -- you can do any additional lsp server setup here
        -- return true if you don't want this server to be setup with lspconfig
        yamlls = function()
          require("lazyvim.util").lsp.on_attach(function(client, bufnr)
            if client.name == "yamlls" and vim.bo.filetype == "helm" then
              vim.lsp.stop_client(bufnr, client.id)
            end
          end)
        end,
      },
      -- make sure mason installs the server
      servers = {
        yamlls = {
          -- Have to add this for yamlls to understand that we support line folding
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = {
                enable = true,
              },
              validate = true,
              hover = true,
              completion = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
              schemas = require("schemastore").yaml.schemas({
                extra = {
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
                ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
                }
              }),
            },
          },
        },
        jsonls = {
          setup = {
            settings = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true }
            },
          },
        },
      },
    },
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
      local cfg = require("yaml-companion").setup({
        -- Add any options here, or leave empty to use the default settings
        -- Additional schemas available in Telescope picker
        schemas = {
          {
            name = "Kubernetes 1.25.9",
            uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.25.9-standalone-strict/all.json",
          },
          {
            name = "Argo Workflows",
            uri = "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json",
          },
          {
            name = "Argo Events",
            uri = "https://github.com/argoproj/argo-events/raw/master/api/jsonschema/schema.json"
          }
        },
        builtin_matchers = {
          kubernetes = { enabled = true },
          cloud_init = { enabled = false}
        }
      })
      require("lspconfig")["yamlls"].setup(cfg)
    end,
  },
}
