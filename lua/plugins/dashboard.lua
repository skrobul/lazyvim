local logo = [[
            ██╗   ██╗██╗███╗   ███╗           
            ██║   ██║██║████╗ ████║           
            ██║   ██║██║██╔████╔██║           
            ╚██╗ ██╔╝██║██║╚██╔╝██║           
             ╚████╔╝ ██║██║ ╚═╝ ██║           
              ╚═══╝  ╚═╝╚═╝     ╚═╝           
]]

logo = string.rep("\n", 8) .. logo .. "\n\n"
return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
      config = {
        header = vim.split(logo, "\n"),
      },
    },
  },
}
