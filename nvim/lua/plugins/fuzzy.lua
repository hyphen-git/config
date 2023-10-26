return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		local actions = require("fzf-lua.actions")
		require("fzf-lua").setup({
			winopts = {
				border = vim.g.border_chars,
			},
		})
		fzf.register_ui_select({ winopts = { height = 0.2, width = 0.2 } })

		local keys = {
			["<leader>f"] = fzf.files,
			["<leader>g"] = fzf.grep,
			["<leader>b"] = fzf.buffers,
			["<leader>dh"] = fzf.help_tags,
			["<leader>dc"] = function()
				fzf.files({ cmd = "yadm ls-files", cwd = vim.env.HOME })
			end,
			["<leader>dn"] = function()
				fzf.files({
					cwd = "~/org/notes",
					actions = {
						["default"] = function(selected, opts)
							actions.file_edit(selected, opts)
						end,
					},
				})
			end,
		}

		for key, map in pairs(keys) do
			vim.api.nvim_set_keymap("n", key, "", {
				callback = map,
				noremap = true,
				silent = true,
			})
		end
	end,
}
