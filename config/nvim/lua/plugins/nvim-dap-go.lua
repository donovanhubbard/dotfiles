return {
  "leoluz/nvim-dap-go",
  lazy = false,
  keys = {
    vim.keymap.set("n", "<leader>bc", "<cmd>lua require('dap').continue()<CR>"),
    vim.keymap.set("n", "<leader>bs", "<cmd>lua require('dap').close()<CR>"),
    vim.keymap.set("n", "<leader>bo", "<cmd>lua require('dap').step_over()<CR>"),
    vim.keymap.set("n", "<leader>bi", "<cmd>lua require('dap').step_into()<CR>"),
    vim.keymap.set("n", "<leader>bb", "<cmd>lua require('dap').toggle_breakpoint()<CR>"),
    vim.keymap.set("n", "<leader>bB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"),
    vim.keymap.set("n", "<leader>bp", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"),
    vim.keymap.set("n", "<leader>br", "<cmd>lua require('dap').repl.open()<CR>"),
    vim.keymap.set("n", "<leader>bu", "<cmd>lua require('dapui').toggle()<CR>"),
    vim.keymap.set("n", "<leader>bt", "<cmd>lua require('dap').debug_test()<CR>"),
  },
  config = function()
    require('dap-go').setup{
      dap_configurations = {
        -- Must be "go" or it will be ignored by the plugin
        type = "go",
        name = "Attach remote",
        mode = "remote",
        request = "attach",
      },
      delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}",
        -- additional args to pass to dlv
        args = {},
        -- the build flags that are passed to delve.
        -- defaults to empty string, but can be used to provide flags
        -- such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example.
        -- passing build flags using args is ineffective, as those are
        -- ignored by delve in dap mode.
        build_flags = "",
      },
    }
  end,
}
