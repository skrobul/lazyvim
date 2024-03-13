return {
  "neovim/nvim-lspconfig",
  opts = {
    config = {
      helm_ls = {
        filetypes = { "helm", "helm.yaml", "helm.tmpl" },
      },
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        },
        schemaStore = {
          enable = true,
        },
      },
    },
  },
}
