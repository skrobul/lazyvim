return {
  "mfussenegger/nvim-dap",
  config = function(_, _)
    -- lazyvim defaults
    local Config = require("lazyvim.config")
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(Config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end
    -- end of lazyvim defaults

    local dap = require("dap")
    dap.adapters = {
      python = {
        type = "executable",
        -- command = "path/to/virtualenvs/debugpy/bin/python",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      },
      debugpy = {
        type = "executable",
        -- command = "path/to/virtualenvs/debugpy/bin/python",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      },
      ruby = function(callback, config)
        callback({
          type = "server",
          host = "127.0.0.1",
          port = "${port}",
          executable = {
            command = "bundle",
            args = {
              "exec",
              "rdbg",
              "-n",
              "--open",
              "--port",
              "${port}",
              "-c",
              "--",
              "bundle",
              "exec",
              config.command,
              config.script,
            },
          },
        })
      end,
    }
    dap.configurations = {
      python = {
        {
          -- The first three options are required by nvim-dap
          type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
          request = "launch",
          name = "Launch file",
          -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

          program = "${file}", -- This configuration will launch the current file if used.
          pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
              return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
              return cwd .. "/.venv/bin/python"
            else
              return "/usr/bin/python"
            end
          end,
        },
        {
          type = 'python',
          request = 'launch',
          name = 'Local Launch with gevent',
          program = '${file}',
          gevent = true
        },
        {
          name = 'Attach localhost:5678',
          type = 'python',
          request = 'attach',
          port = 5678,
          host = '127.0.0.1',
          -- /var/lib/openstack/lib/python3.10/site-packages/neutron_understack/routers.py
          pathMappings = {
            {
            localRoot = "${workspaceFolder}/python/neutron_understack/",
            remoteRoot = "/var/lib/openstack/lib/python3.10/site-packages/"
            }
          }
        }
      },
      ruby = {
        {
          type = "ruby",
          name = "debug current file",
          request = "attach",
          localfs = true,
          command = "ruby",
          script = "${file}",
        },
        {
          type = "ruby",
          name = "run current spec file",
          request = "attach",
          localfs = true,
          command = "rspec",
          script = "${file}",
        },
      },
    }
  end,
  keys = {
    {
      "<leader>dz",
      function()
        require("dap.ext.vscode").load_launchjs(nil, {})
      end,
      desc = "Load launch.json",
    },
    {
      "<leader>df",
      function()
        local dap = require("dap")
        local lines = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"))
        dap.repl.open()
        dap.repl.execute(table.concat(lines, "\n"))
      end,
      desc = "Send to repl"
    },
  },
}
