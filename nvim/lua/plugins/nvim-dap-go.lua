return {
  "leoluz/nvim-dap-go",
  ft = "go",
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
    local function get_arguments()
      return coroutine.create(function(dap_run_co)
        local args = {}
        vim.ui.input({ prompt = "Args: " }, function(input)
          args = vim.split(input or "", " ")
          coroutine.resume(dap_run_co, args)
        end)
      end)
    end

    require('dap-go').setup {

      dap_configurations = {
        {
          type = "go",
          name = "Debug Package With Args",
          request = "launch",
          program = "${fileDirname}",
          args = get_arguments
        },
      },
    }
  end,
}
