return {

	"codota/tabnine-nvim",
	config = function()
		require("lazy").setup({
			{ "codota/tabnine-nvim", build = "./dl_binaries.sh" },
		})
	end,
}
