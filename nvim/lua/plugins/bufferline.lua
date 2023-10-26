return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	lazy = false,
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				separator_style = "thin",
				show_buffer_close_icons = false,
				show_close_icons = false,
				color_icons = true,
			},
		})

		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
	end,
}
