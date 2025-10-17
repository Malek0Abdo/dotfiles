	return {
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",

				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				defaults = {
				  mappings = {
				    i = {
              ["<esc>"] = require("telescope.actions").close,
          },
				  },
				},
				pickers = {},
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fh", builtin.oldfiles, { desc = "Find History" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "Find Select Telescope" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find current Word" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by Grep" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find Resume" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Find Neovim files" })
		end,
	}
