set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

autocmd TermOpen * :set nonumber norelativenumber

lua require('plugins')

lua <<EOF

local colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'distinguished',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
          'filename',
          file_status = true,
          path = 1
     },
    },
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {
      -- {
      --     'diff',
      --     color_added = colors.green,
      --     color_modified = colors.orange,
      --     color_removed = colors.red,
      --     color = { fg = '#ffffff' },
      -- },
      {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          color_error = colors.red,
          color_warn = colors.yellow,
          color_info = colors.cyan,
          -- color = { fg = '#rrggbb', bg = '#rrggbb', gui = 'bold' },
      },
    },
    lualine_z = {'location'}
    },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- require("buftabline").setup {
--     modifier = ":t",
--     index_format = "%d: ",
--     buffer_id_index = false,
--     padding = 1,
--     icons = true,
--     icon_colors = false,
--     start_hidden = false,
--     auto_hide = false,
--     disable_commands = false,
--     go_to_maps = true,
--     kill_maps = false,
--     next_indicator = "",
--     custom_command = nil,
--     custom_map_prefix = nil,
--     hlgroup_current = "TabLineSel",
--     hlgroup_normal = "TabLineFill"
-- }

EOF

set guicursor=i:block

let g:test#neovim#term_position = "botright 40"
let g:test#strategy = "neovim"

lua <<EOF
-- local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
-- ft_to_parser.someft = "javascript"

-- local parser_config = require "nvim-treesitter.parsers".filetype_to_parsername
-- parser_config.typescript.used_by = "javascript"

-- local ft_to_parser = require('nvim-treesitter.parsers').filetype_to_parsername
-- ft_to_parser.rspec = 'ruby'
-- ft_to_parser.ruby = 'ruby'

vim.treesitter.language.register('ruby', 'rspec')

 local custom_captures = {
   ["export"] = "TSExport",
   ["return"] = "TSReturn",
   ["debugger"] = "TSDebugger",
   ["arrow"] = "TSArrow",
   ["dot"] = "TSDot",
   ["jsx.prop"] = "TSJsxProp",
   ["jsx.element"] = "TSJsxElement",
   ["jsx.close.element"] = "TSJsxCloseElement",
   ["className"] = "TSJsxClassName",
   ["reactHook"] = "TSJsxReactHook",
   ["function.call"] = "TSJsxFunctionCall",
   ["namespace"] = "TSJsxNameSpace",
   ["object.pair.key"] = "TSObjectPairKey",
-- ruby
   ["ruby.module"] = "TSModuleName",
   ["instance_variable"] = "TSInstanceVariable",
   ["block.parameters"] = "TSBlockParameterList",
   ["rails.callback"] = "TSRailsCallback",
   ["rails.response"] = "TSRailsResponse",
   ["ruby.macro"] = "TSRubyMacro",
   ["ruby.end"] = "TSRubyEnd",
   ["ruby.return"] = "TSRubyReturn",
   ["ruby.include"] = "TSRubyInclude",
   ["ruby.accessor"] = "TSRubyAccessor",
   ["ruby.entity"] = "TSRubyEntity",
   ["rspec.keyword"] = "TSRspecKeyword",
   ["rspec.test.macro"] = "TSRspecTestMacro",
   ["rspec.before.and.after"] = "TSRspecBeforeAndAfter",
   ["rspec.matchers"] = "TSRspecMatchers",
   ["ruby.method.end"] = "TSRubyMethodEnd",
   ["extends"] = "TSExtends",
   ["sorbet.signature"] = "TSSorbetSignature"

   }

 require'nvim-treesitter.configs'.setup {
endwise = {
  enable = true,
},
    ensure_installed = {
        "c",
        "vim",
        "lua",
        "bash",
        "css",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "ruby",
        "scss",
        "toml",
        "typescript",
        "commonlisp",
        "tsx",
        "yaml",
    },
 highlight = {
 enable = true,
 use_languagetree = true,
 custom_captures = custom_captures,
 -- additional_vim_regex_highlighting = true,
 },
   indent = {
   enable = false,
   },
incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
	-- nvim-treesitter-textobjects
	textobjects = {
    move = {
      enable = false,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
		select = {
			enable = false,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	}

 }

require('ts_context_commentstring').setup {}
vim.g.skip_ts_context_commentstring_module = true


-- require"nvim-treesitter.highlight".set_custom_captures(custom_captures)

EOF

lua <<EOF
-- local actions = require('telescope.actions')
--
-- require('telescope').setup{
--   extensions = {
--     fzf = {
--       fuzzy = true,                    -- false will only do exact matching
--       override_generic_sorter = true, -- override the generic sorter
--       override_file_sorter = true,     -- override the file sorter
--       -- case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--                                        -- the default case_mode is "smart_case"
--     },
--     fzf_writer = {
--       use_highlighter = false,
--       minimum_grep_characters = 6,
--       minimum_files_characters = 4,
--     },
--   },
--   defaults = {
--     shorten_path = true,
--     winblend = 1,
--     -- selection_strategy = "reset",
--     -- scroll_strategy = "cycle",
--     vimgrep_arguments = {
--       'rg',
--       '--color=never',
--       '--no-heading',
--       '--with-filename',
--       '--line-number',
--       '--column',
--       '--smart-case'
--     },
--     layout_strategy = "bottom_pane",
--     layout_config = {
--       height = 25,
--     },
--     preview_title = "",
--     border = false,
--     borderchars = {
--       "z",
--       prompt = { " " },
--       results = { " " },
--       -- results = { "a", "b", "c", "d", "e", "f", "g", "h" },
--       preview = { " " },
--     },
--     -- sorting_strategy = "descending",
--     -- prompt_position = "top",
--     color_devicons = true,
--     sorting_strategy = "ascending",
--     -- border = {},
--     use_less = true,
--
--     -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
--
--     -- file_sorter = require("telescope.sorters").get_fzy_sorter,
--     file_ignore_patterns = { "parser.c" },
--     file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--     grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--     qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
--     mappings = {
--       i = {
--         ["<M-cr>"] = actions.send_selected_to_qflist + actions.open_qflist,
--         ["<C-q>"] = actions.send_to_qflist,
--         ["<esc>"] = actions.close,
--       },
--       n = {
--         ["<M-cr>"] = actions.send_selected_to_qflist + actions.open_qflist,
--         ["<C-q>"] = actions.send_to_qflist,
--         ["<esc>"] = actions.close,
--       },
--     },
--   },
-- }
--
-- require('telescope').load_extension('fzf')
-- require('telescope').load_extension('fzy_native')

local lspconfig = require"lspconfig"
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gsh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap("n", "<space>cs", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
  -- buf_set_keymap("i", "<C-P>", "<cmd>lua vim.lsp.buf.completion()<CR>", opts)
end

require'lspconfig'.sorbet.setup{
     cmd = { "start-sorbet" },
     filetypes = { "ruby" },
     on_attach = on_attach,
     handlers = {
       ["textDocument/publishDiagnostics"] = vim.lsp.with(
         vim.lsp.diagnostic.on_publish_diagnostics, {
           -- Disable virtual_text
           virtual_text = false,
           underline = false
         }
       ),
     },
}

lspconfig.flow.setup{
     on_attach = on_attach,
     handlers = {
       ["textDocument/publishDiagnostics"] = vim.lsp.with(
         vim.lsp.diagnostic.on_publish_diagnostics, {
           -- Disable virtual_text
           virtual_text = false,
           underline = false
         }
       ),
     },
   trace = {
     server = true
     }
}

lspconfig.eslint.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = { "start-eslint" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Disable virtual_text
      virtual_text = false,
      underline = false
      }
    ),
  },
  init_options = {
    documentFormatting = true
  },
  on_new_config = function(config, new_root_dir)
    config.settings.workspaceFolder = {
      uri = new_root_dir,
      name = vim.fn.fnamemodify(new_root_dir, ':t'),
    }
  end,
  -- root_dir = { "/app" },
  -- root_dir = function(startpath)
  --   return M.search_ancestors(startpath, matcher)
  -- end,
  settings = {
   codeAction = {
     disableRuleComment = {
        enable = true,
        location = "separateLine"
      },
      showDocumentation = {
        enable = true
      }
   },
    codeActionOnSave = {
      enable = true,
      mode = "all"
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    packageManager = "npm",
    quiet = false,
    rulesCustomizations = {},
    run = "onType",
    useESLintClass = false,
    validate = "on",
    workingDirectory = {
      mode = "auto"
    }
  },
}

-- local eslint = {
--   lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
--   lintStdin = true,
--   lintFormats = {"%f:%l:%c: %m"},
--   lintIgnoreExitCode = true,
--   formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--   formatStdin = true
-- }

-- local efm_root_markers = { 'package.json', '.git/' }

-- lspconfig.efm.setup{
--   root_dir = lspconfig.util.root_pattern(unpack(efm_root_markers)),
--   on_attach = on_attach,
--   handlers = {
--     ["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--       -- Disable virtual_text
--       virtual_text = false,
--       underline = false
--       }
--     ),
--   },
--   init_options = {
--     documentFormatting = true
--   },
--   settings = {
--     rootMakers = efm_root_markers,
--     languages = {
--       javascript = {eslint},
--       javascriptreact = {eslint},
--       ["javascript.jsx"] = {eslint},
--       typescript = {eslint},
--       ["typescript.tsx"] = {eslint},
--       typescriptreact = {eslint}
--     }
--   },
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescript.tsx",
--     "typescriptreact"
--   },
-- }

lspconfig.solargraph.setup{
  cmd = { "start-solargraph" },
  filetypes = { "ruby" },
  on_attach = on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Disable virtual_text
      virtual_text = false,
      underline = false
      }
    ),
  },
}

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

require'lspconfig'.tsserver.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
   cmd = { "start-tsserver" },
   on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = true
        client.server_capabilities.document_range_formatting = false
        client.server_capabilities.semanticTokensProvider = null

        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)

        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")

        on_attach(client, bufnr)
   end,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Disable virtual_text
      virtual_text = false,
      underline = false
      }
    ),
  },
}

require'lspconfig'.syntax_tree.setup{
  cmd = { "start-syntax-tree" },
  filetypes = { "ruby" },
  on_attach = on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Disable virtual_text
      virtual_text = false,
      underline = false
      }
    ),
  },
}

local null_ls = require("null-ls")

null_ls.setup({
    debug = true,
    sources = {
        -- null_ls.builtins.diagnostics.semgrep,
        -- .with({
        --     condition = with_root_file(".semgrep.yml"),
        --   }),

        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.code_actions.eslint_d
        -- null_ls.builtins.formatting.eslint_d
    },
    on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <leader>cs :lua vim.lsp.buf.format { async = true }<CR>")

    --   -- format on save
    --   vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format { async = true }")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
    end,
    handlers = {
      ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual_text
        virtual_text = false,
        underline = false
        }
      ),
    },
})

local helpers = require("null-ls.helpers")
local u = require("null-ls.utils")

null_ls.register({
    method = null_ls.methods.FORMATTING,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    generator = helpers.formatter_factory({
        command = "start-prettier",
        args = {
          "$FILENAME",
          "$ROOT",
        },
        to_stdin = true,
        check_exit_code = function(code)
            if code ~= 0 then
                vim.schedule(function()
                    vim.notify(
                        "Failed to run formatter. Is Docker container running?",
                        vim.log.levels.ERROR
                    )
                end)
                return false
            else
                return true
            end
        end,
    }),
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
vim.lsp.handlers.hover, {
	border = {
		{'┌', 'FloatBorder'},
		{'─', 'FloatBorder'},
		{'┐', 'FloatBorder'},
		{'│', 'FloatBorder'},
		{'┘', 'FloatBorder'},
		{'─', 'FloatBorder'},
		{'└', 'FloatBorder'},
		{'│', 'FloatBorder'}
	}
}
)

require'nvim-lastplace'.setup{}

require('cokeline').setup({
  show_if_buffers_are_at_least = 1,
  mappings = {
    cycle_prev_next = true
  },
  buffers = {
    filter_valid = function(buffer)
        return buffer.type ~= "terminal" and buffer.type ~= "quickfix"
    end,
  }
})

local actions = require "fzf-lua.actions"
require'fzf-lua'.setup {
  winopts = {
    height           = 0.40,         -- window height
    width            = 1.0,            -- window width
    row              = 0.9999,            -- window row position (0=top, 1=bottom)
    col              = 0.5,            -- window col position (0=left, 1=right)
    preview = {
      vertical = "up:60%",
      horizontal = "right:40%",
      layout = "vertical"
      },
  },
  files = {
    multiprocess = true,
    previewer = "builtin",
    git_icons = false,
    file_icons = true,
  },
  previewers = {
    builtin = {
      delay           = 500,          -- delay(ms) displaying the preview
                                      -- prevents lag on fast scrolling
      syntax          = true,         -- preview syntax highlight?
      scrollbar = false,
      layout = "vertical",
      vertical = "up:60%",
      horizontal = "right:35%",
      title = false
    },
  },
  fzf_opts = {
    -- options are sent as `<left>=<right>`
    -- set to `false` to remove a flag
    -- set to '' for a non-value flag
    -- for raw args use `fzf_args` instead
    ['--ansi']        = '',
    ['--info']        = 'inline',
    ['--height']      = '100%',
    ['--layout']      = 'reverse-list',
    ['--border']      = 'none',
  },
}

local neogit = require('neogit')
neogit.setup {}

-- local prettier = require("prettier")

-- prettier.setup({
--   ["null-ls"] = {
--     runtime_condition = function(params)
--       -- return false to skip running prettier
--       return true
--     end,
--   },
--   bin = 'prettier',
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "typescript",
--     "typescriptreact"
--   },
-- })

-- require("hardtime").setup()
require('pqf').setup()

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

EOF

