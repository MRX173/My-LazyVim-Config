local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				colorscheme = "solarized-osaka",
				news = {
					lazyvim = true,
					neovim = true,
				},
			},
		},
<<<<<<< HEAD
 {
    "neovim/nvim-lspconfig",
    config = function()
        -- LSP configuration for C#
        require("lspconfig").omnisharp.setup({
            cmd = { "dotnet", "C:/Users/moham/AppData/Local/nvim-data/mason/packages/omnisharp/libexec/OmniSharp.dll" }, -- Ensure the OmniSharp server is installed
            root_dir = require("lspconfig").util.root_pattern(".git", ".sln", ".csproj"), -- Automatically finds the project root
            handlers = {
                ["textDocument/definition"] = require('omnisharp_extended').handler, -- Custom handler for go-to definition
            },
            capabilities = require('cmp_nvim_lsp').default_capabilities(), -- Enable auto-completion capabilities

            settings = { -- OmniSharp specific settings
                FormattingOptions = {
                    EnableEditorConfigSupport = true, -- Enables support for reading code style from .editorconfig
                    OrganizeImports = false, -- Specifies whether to group/sort 'using' directives on formatting
                },
                MsBuild = {
                    LoadProjectsOnDemand = false, -- Load projects for files that were opened in the editor
                },
                RoslynExtensionsOptions = {
                    EnableAnalyzersSupport = false, -- Support for roslyn analyzers
                    EnableImportCompletion = false, -- Show unimported types in completion lists
                },
                Sdk = {
                    IncludePrereleases = true, -- Include preview versions of the .NET SDK
                },
            },

            on_attach = function(client, bufnr)
                print("OmniSharp LSP attached") -- Add a debug message
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end
                local opts = { noremap = true, silent = true }

                -- Map <leader>ca to code actions
                buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
            end,
        })
    end,
},
  { 
=======
    { 
>>>>>>> 5497deca27bacde434490196a2b052946cf3b034
        'nvim-telescope/telescope-fzf-native.nvim', 
        build = 'cmake -S. -Bbuild && cmake --build build',  -- or 'make' if you installed it
        shell = 'cmd.exe'  -- Specify the shell if needed
    },
		-- import any extras modules here
		{ import = "lazyvim.plugins.extras.linting.eslint" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		-- { import = "lazyvim.plugins.extras.lang.markdown" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.tailwind" },
		{ import = "lazyvim.plugins.extras.coding.copilot" },
		-- { import = "lazyvim.plugins.extras.dap.core" },
		-- { import = "lazyvim.plugins.extras.vscode" },
		{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
		-- { import = "lazyvim.plugins.extras.test.core" },
		-- { import = "lazyvim.plugins.extras.coding.yanky" },
		-- { import = "lazyvim.plugins.extras.editor.mini-files" },
		-- { import = "lazyvim.plugins.extras.util.project" },
		{ import = "plugins" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	dev = {
		path = "~/.ghq/github.com",
	},
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		custom_keys = {
			["<localleader>d"] = function(plugin)
				dd(plugin)
			end,
		},
	},
	debug = false,
})
