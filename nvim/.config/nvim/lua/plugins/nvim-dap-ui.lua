return {
  "rcarriga/nvim-dap-ui",
  ft = "go",
  config = function()
    require("dapui").setup()

		-- local dap, dapui = require("dap"), require("dapui")
		-- dap.listeners.before.attach.dapui_config = function()
		-- 	dapui.open()
  --     print("attach")
		-- end
		-- dap.listeners.before.launch.dapui_config = function()
		-- 	dapui.open()
  --     print("launch")
		-- end
		-- dap.listeners.before.event_terminated.dapui_config = function()
		-- 	dapui.close()
  --     print("terminated")
		-- end
		-- dap.listeners.before.event_exited.dapui_config = function()
		-- 	dapui.close()
  --     print("exited")
		-- end
  end,
}
