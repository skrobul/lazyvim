local extra_schemes = {
  {
    description = "Github Actions",
    fileMatch = ".github/action.{yml,yaml}",
    url = "http://json.schemastore.org/github-action",
    name = "github-action",
  },
  {
    description = "Ansible Stable 2.9",
    url = "http://json.schemastore.org/ansible-stable-2.9",
    name = "ansible-stable-2.9",
    fileMatch = "roles/tasks/*.{yml,yaml}",
  },
  {
    description = "Prettierrc",
    url = "http://json.schemastore.org/prettierrc",
    name = "prettierrc",
    fileMatch = ".prettierrc.{yml,yaml}",
  },
  {
    description = "Kustomization",
    url = "http://json.schemastore.org/kustomization",
    name = "kustomization",
    fileMatch = "kustomization.{yml,yaml}",
  },
  {
    description = "Ansible Playbooks",
    url = "http://json.schemastore.org/ansible-playbook",
    name = "ansible-playbook",
    fileMatch = "*play*.{yml,yaml}",
  },
  {
    description = "Helm Chart",
    url = "http://json.schemastore.org/chart",
    name = "Helm Chart",
    fileMatch = "Chart.{yml,yaml}",
  },
  {
    description = "Dependabot config",
    url = "https://json.schemastore.org/dependabot-v2",
    name = "Dependabot config",
    fileMatch = ".github/dependabot.{yml,yaml}",
  },
  {
    description = "Gitlab CI",
    url = "https://json.schemastore.org/gitlab-ci",
    name = "Gitlab CI",
    fileMatch = "*gitlab-ci*.{yml,yaml}",
  },
  {
    description = "OpenAPI v3",
    url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
    name = "OpenAPI v3",
    fileMatch = "*api*.{yml,yaml}",
  },
  {
    description = "Docker Compose",
    url = "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json",
    name = "Docker Compose",
    fileMatch = "*docker-compose*.{yml,yaml}",
  },
  {
    description = "Argo Workflows",
    url = "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json",
    name = "Argo Workflows",
    fileMatch = {
      "**argo-workflows/**/workflowtemplates/*.{yml,yaml}",
      "**argo-workflows/**/workflows/*.{yml,yaml}",
    },
  },
  {
    description = "Argo Events",
    url = "https://github.com/argoproj/argo-events/raw/master/api/jsonschema/schema.json",
    name = "Argo Events",
    fileMatch = "/**argo-workflows/**/sensors/*.{yml,yaml}",
  },
  {
    name = "SealedSecret",
    description = "Sealed Secret",
    fileMatch = "sealed-*{yaml,yml}",
    url = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/bitnami.com/sealedsecret_v1alpha1.json",
  },
  {
    url = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json",
    name = "Argo CD Application",
    description = "Argo CD Application",
    fileMatch = "argocd-application.yaml",
  },
}

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
    event = "LazyFile",
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
            vim.list_extend(
              new_config.settings.yaml.schemas,
              require("schemastore").yaml.schemas({ extra = extra_schemes })
            )
          end,
          -- don't set any settings here, they will be overriden by the config
          -- injected in the yaml-companion plugin below
          settings = {},
        },
        jsonls = {
          setup = {
            settings = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
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
      { "b0o/SchemaStore.nvim" },
    },
    ft = "yaml",
    config = function()
      require("telescope").load_extension("yaml_schema")

      local extra_companion_schemas = {}
      for _, schema in ipairs(extra_schemes) do
        table.insert(extra_companion_schemas, { name = schema.name, uri = schema.url })
      end

      local cfg = require("yaml-companion").setup({

        -- Add any options here, or leave empty to use the default settings
        -- Additional schemas available in Telescope picker
        schemas = extra_companion_schemas,
        builtin_matchers = {
          kubernetes = { enabled = true },
          cloud_init = { enabled = false },
        },
        lspconfig = {
          settings = {
            redhat = { telemetry = { enabled = false } },
            flags = {
              debounce_text_changes = 150,
            },
            trace = { server = "info" },
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
                extra = extra_schemes,
              }),
            },
          },
        },
      })
      require("lspconfig")["yamlls"].setup(cfg)
    end,
  },
}
