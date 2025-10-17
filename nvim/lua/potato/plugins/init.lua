return {
	"nvim-lua/plenary.nvim",
	"ThePrimeagen/vim-be-good",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"mbbill/undotree",
		keys = { { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" } },

		opts = {
			filesystem = {
				window = {
					width = 30,
				},
			},
		},
	},
}
