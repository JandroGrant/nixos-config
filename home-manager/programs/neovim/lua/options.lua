-- ================================================================================================
-- TITLE : config/options.lua
-- ABOUT : basic settings native to neovim
-- ================================================================================================

-- basic settings =================================================================================
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.scrolloff = 10 -- keep 10 lines above/below the cursor
vim.opt.sidescrolloff = 8 -- keep 8 columns to the left/right of the cursor
vim.opt.wrap = false -- don't wrap the lines
vim.opt.cmdheight = 1 -- command line height
vim.opt.spelllang = { "en", "es" } -- languages for spellchecking ( english and spanish )

-- tabbing and indentation ========================================================================
vim.opt.tabstop = 2 -- tab width
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indenting
vim.opt.autoindent = true -- copy indent from current line
vim.opt.grepprg = "rg --vimgrep" -- use ripgrep if available
vim.opt.grepformat = "%f:%1:%c:%m" -- filename, line number, column, content

-- search settings ================================================================================
vim.opt.ignorecase = true -- case-insensitive search
vim.opt.smartcase = true -- case-sensitive search if uppercase in search
vim.opt.hlsearch = false -- don't highlight search results
vim.opt.incsearch = true -- show matches as you type

-- visuals ========================================================================================
vim.opt.winborder = "rounded"
vim.opt.termguicolors = true -- enable 24-bit colors
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.colorcolumn = "100" -- show column at 100 characters
vim.opt.showmatch = true -- hightlight matching brackets
vim.opt.matchtime = 3 -- how long to highlight matching brackets
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.showmode = false -- don't show mode in command line
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.winblend = 0 -- floating window transparency
vim.opt.conceallevel = 0 -- don't hide markup
vim.opt.concealcursor = "" -- show markup even on cursor line
vim.opt.lazyredraw = false -- redraw while executing macros (butter ux)
vim.opt.redrawtime = 10000 -- timeout for syntax highlighting redraw
vim.opt.maxmempattern = 20000 -- max memory for pattern matching
vim.opt.synmaxcol = 300 -- syntax highlighting column limit

vim.diagnostic.config({ -- diagnostic icons
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})

-- file handling ==================================================================================
vim.opt.backup = false -- don't create backup files
vim.opt.writebackup = false -- don't backup before overwriting
vim.opt.swapfile = false -- don't create swap files
vim.opt.undofile = true -- persistent undo
vim.opt.updatetime = 300 -- time in ms to trigger CursorHold
vim.opt.timeoutlen = 500 -- time in ms to wait for mapped sequence
vim.opt.ttimeoutlen = 0 -- no wait for key code sequences
vim.opt.autoread = true -- auto-reload file if changed outside
vim.opt.autowrite = false -- don't auto-save on some events
vim.opt.diffopt:append("vertical") -- vertical diff splits
vim.opt.diffopt:append("algorithm:patience") -- better diff algorithm
vim.opt.diffopt:append("linematch:60") -- better diff highlighting (smart line matching)

-- set undo director and ensure it exists
local undodir = "~/.local/share/nvim/undodir" -- undo directory path string literal
vim.opt.undodir = vim.fn.expand(undodir) -- expand to full path
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p") -- create path if path does not exist
end

-- behavior settings ==============================================================================
vim.opt.errorbells = false -- disable error sounds
vim.opt.backspace = "indent,eol,start" -- make backspace mehave naturally
vim.opt.autochdir = false -- don't change directory automatically
vim.opt.iskeyword:append("-") -- treat dash as part of a word
vim.opt.path:append("**") -- search into subfolders with 'gf'
vim.opt.selection = "inclusive" -- use inclusive selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true -- allow editing buffers
vim.opt.encoding = "UTF-8" -- use utf-8 encoding
vim.opt.wildmenu = true -- enable command-line completion menu
vim.opt.wildmode = "longest:full,full" -- completion mode for command-line
vim.opt.wildignorecase = true -- case-insensitive tab completion in commands

-- cursor settings ================================================================================
vim.opt.guicursor = {
	"n-v-c:block", -- normal, visual, command-line
	"i-ci-ve:ver100", -- insert, command-line insert, visual-exclusive
	"r-cr:hor20", -- replace, command-line replace
	"o:hor50", -- operator-pending
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- all modes: blinking & highlight groups
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- showmatch mode
}

-- folding settings ===============================================================================
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- keep all folds open by default

-- split behavior =================================================================================
vim.opt.splitbelow = true -- horizontal splits open below
vim.opt.splitright = true -- vertical splits open to the right

--[[ ==============================================================================================
⠪⣐⢑⢌⠆⡕⡱⡘⡌⡪⡸⡨⡪⡪⡪⡪⡪⡪⡺⣸⢪⡳⣝⢮⡳⡽⡵⡯⡯⡯⣯⢯⢿⣽⣻⣽⣿⣻⡿⣟⣿⣟⣿⣟⣿⣻⣟⣿⣻⣟⣿⣻⣟⣿⢯⣿⡽⣯⢿⡽⣯⢯⣯⡯⣿⡽⣯⢿⡽⡯⣯⡻⣪⢗⣝⢮⡳⣹⡪⡞⡮⡺⡸⡜⡜⡜⢜⢌⠪⡢⡑⢌⠢⡑⢌⠢⡑⢌⠢
⢣⠢⡣⢢⠣⡪⢢⢱⢸⢨⠪⡊⡎⡎⡎⡎⡮⡪⣣⢳⢕⡽⣪⢗⡽⡽⡽⡽⣽⣫⣯⢿⣽⢾⣯⣷⢿⣽⣿⢿⣟⣿⣽⣿⣻⣿⣻⣿⣽⣿⣽⣿⣽⣟⣯⣷⣿⣻⣯⣿⣽⢿⣞⣿⢷⣟⣯⣿⢽⢯⣳⢽⣳⣫⣞⣗⡽⡵⣝⢮⡳⡹⡜⡜⡜⡜⢌⢆⠣⡒⢌⠢⡃⡊⡢⡑⢌⠢⡑
⡱⢱⠸⡘⡜⢜⢜⢜⢔⢕⢝⢜⡜⣜⢎⡞⣜⡕⡧⣫⢞⢮⣳⡫⡯⡯⡯⣟⣷⣻⣞⣿⢾⣻⣾⣯⣿⣿⣾⣿⣿⣿⡿⣟⢿⡻⡻⡝⡟⡞⡟⡽⣟⣿⣻⢿⣽⣿⣷⣿⢿⣿⣿⢿⣿⣟⣿⡾⣟⣯⣯⣟⣾⣺⣺⢮⢯⡺⣕⢗⡝⡎⡇⡇⡇⡣⡱⡐⠕⢌⠢⡑⢌⢌⠢⡊⡢⡑⡑
⡇⡇⡇⡇⡇⡇⡇⡎⡎⣎⢮⢪⡺⣜⢵⡹⣜⢮⣫⢮⣳⣫⣞⢾⢽⡽⣯⣟⣾⣳⡿⣾⢿⣻⣷⣿⣻⣾⣿⡿⣯⢗⢏⢗⢵⢱⢕⡕⡎⡎⢜⠪⡒⢕⢕⢟⡿⡯⡿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣟⣷⣻⣞⣞⣞⢽⢕⡯⢮⢳⡱⡹⡸⡸⡸⡨⡢⡑⢍⠢⡱⢘⡐⢅⠕⢌⠢⡊⡂
⢇⢎⢎⢪⠪⡪⡪⡪⡺⡸⡪⡣⣗⢵⡳⣝⢮⢷⢽⢵⣳⢷⡽⣯⣿⣽⡷⣿⡾⣯⣿⣟⣿⣿⣯⣿⣿⣿⣻⢏⢇⢫⢊⢎⠢⡊⠔⢐⠐⡨⠐⠅⠪⠐⠄⠅⠣⡫⣫⡺⡽⣿⣽⣿⣿⣾⣿⣿⡷⣿⣻⣞⡾⣺⢮⣫⡳⣝⡕⡧⣫⢪⡣⡣⡣⡪⡢⡱⠡⡃⡪⡂⡪⠢⡑⢅⠕⢌⠢
⡇⡎⡪⡪⡪⡪⡪⡪⡪⡺⣸⢹⢜⢵⢝⡮⡯⣫⢯⢯⢿⡽⣟⣿⣾⣷⣿⣿⢿⣿⣻⣿⣿⣻⣿⣿⢿⡽⡪⡕⡮⣎⢎⢊⢐⢐⢨⠠⢁⠂⠡⠈⠌⠌⢜⠈⠄⡑⢕⢕⢝⢽⣿⣻⣿⣟⣿⣷⡿⣟⣷⢯⡯⣗⡯⣞⣞⢮⡺⣕⢧⡳⡕⣇⢇⢧⢪⢪⠪⡊⡆⡕⢜⢌⠪⡢⢱⠡⡃
⢕⢜⠜⡌⡎⡜⡜⡜⡜⡎⡎⡧⡫⡳⣝⢮⡫⡯⡯⣻⢽⣻⢿⣽⣾⣷⣿⣻⣿⣟⣿⣟⣿⣿⣿⣟⡯⡫⡣⡫⡪⢂⡆⡇⡣⡑⡐⢌⢐⠈⠄⡁⠅⡑⢐⠈⠄⠌⡪⢊⠜⡜⣾⡿⣿⣿⢿⣷⣿⣿⣟⣯⣟⡷⣯⣗⣗⣟⣞⣵⣳⢝⣞⢮⡳⣕⢇⡇⡏⡎⡎⡪⡢⡣⡣⡪⡢⡣⡣
⡅⡇⢇⢇⢇⢇⢇⢇⢇⢇⢏⢎⢗⡝⣎⢗⢽⢕⡯⡯⡯⡯⣟⡷⡿⣾⣻⣽⣷⣿⢿⡿⣿⣿⣯⡟⡎⢎⠪⡰⢸⠸⡸⡸⠲⡕⡕⡢⠂⠌⡐⡀⢂⢐⢐⢌⠄⠅⢌⢂⠕⢸⢸⣻⣿⣿⣿⣿⣿⣯⣿⣟⣯⣿⡷⣟⣷⣟⡾⣞⣾⢽⣺⣳⢽⡪⣗⡝⣎⢧⢫⡪⡎⡎⡎⡎⡎⡎⡎
⢱⠸⡘⡔⢕⢅⢇⢣⢣⢣⢣⢫⢪⡪⠮⡝⣎⢗⣝⢮⢯⣫⢗⡯⡿⡽⣽⣞⡷⣟⣿⣻⣟⣯⣿⢵⠩⢂⠇⡊⡢⢑⠸⡐⡕⡡⡑⠔⡁⠅⠐⡀⡂⡢⠱⡐⡅⡊⠄⡇⠌⡂⢇⣟⣿⢿⣿⣟⣯⣿⣯⣿⣟⣷⡿⣟⣷⢿⡽⣟⣾⣻⢞⣞⣗⣟⢞⡮⡳⣝⢎⢮⡪⡎⡮⡪⡪⡪⡪
⢕⢕⢱⢑⢕⢱⢑⢕⢕⢕⢕⢕⢕⢵⢹⢪⢎⢧⢳⡹⣪⢞⡽⣹⢽⣝⣗⣷⣻⡽⣾⢯⣿⣟⣯⠣⡡⡑⢌⠐⠤⡑⠅⠕⡌⠢⡨⠨⢐⠐⠅⡂⡪⢨⠪⡪⣂⠢⡑⡌⠂⠌⢆⠺⡾⣿⣿⣻⡿⣯⣿⢾⡿⣽⢿⣻⣯⢿⣻⢯⡷⣯⢯⣗⣗⣗⡯⣞⣝⢮⢳⢕⢇⡏⡮⡪⣣⢫⡪
⡱⡘⡌⡎⡪⡪⢪⢪⢢⢣⢣⢣⢣⡣⡳⣕⢝⣎⢗⣝⢮⣳⢝⣗⡯⣞⣾⣺⣞⣯⣿⣻⣷⡿⡣⡡⡂⠣⠡⠊⠌⠢⡑⢅⠃⠅⡂⠡⠐⡨⠨⢂⠪⡢⡣⡣⡢⢑⠨⢂⠁⠌⠌⠕⡝⣿⣽⣯⢿⣻⣾⣻⣻⡽⣟⣽⢞⡯⣯⣻⡺⣝⣗⢗⡗⣗⣝⢮⢎⡗⣝⢎⢧⢳⡱⡝⡼⡸⡜
⡣⡱⡑⡕⢕⢜⢜⢜⢜⢜⢜⢜⡜⣜⢎⢮⡣⣳⢝⡮⣳⢽⢽⣺⢽⣳⣻⣞⡷⣿⢾⣟⣷⢍⢪⢘⠌⢌⠊⠌⠌⡂⢂⠅⡈⡂⠔⠨⢐⢄⠕⡅⡧⡳⡕⡇⠕⡀⠌⢂⠐⢈⢈⠢⡑⡵⡿⣾⣻⣽⢾⡽⣞⣯⣟⢾⢽⢽⣺⡪⡯⣺⡪⣗⢽⣪⡺⣜⢵⢱⢕⢵⢱⢱⢱⢱⢱⢱⢕
⡪⡪⡪⡪⡪⡪⡪⡪⡪⡪⡪⡪⡎⡮⡎⣗⢝⢮⡳⡽⡽⡽⣽⣺⢯⣟⣾⣳⣟⣯⣿⢿⡝⡜⢔⠡⡑⠅⢅⢕⢔⢜⠴⡰⡐⡄⡕⡜⡜⡔⡝⠜⠕⢝⢘⢘⠨⡀⢐⠠⢈⠠⢀⠢⠈⠆⢏⢿⡿⣾⣻⡽⣯⣞⡾⡽⣝⣗⣗⢽⢝⡞⡮⡳⡳⣕⡕⡧⡳⡱⡕⡕⡕⡕⡕⡕⡕⡕⡕
⡣⡣⡪⡪⡪⡪⡪⡪⡪⡪⣪⢺⢜⢎⣗⢵⣫⡳⡽⣝⢾⢽⣺⢞⣟⣞⣗⣟⣾⣻⣞⢧⢣⠃⠅⠂⠄⡪⡮⡺⣊⣌⠈⢄⠕⡱⣵⡱⡁⡂⡰⡡⡁⡢⠠⡁⡪⡐⠄⠂⡐⠨⠀⡂⠅⠅⠣⡱⣻⣯⣯⢿⡵⣗⡯⡯⣗⡗⣗⡽⡳⣝⢮⡫⡞⡮⡪⣇⢗⢕⡕⡕⡕⡕⡕⡕⡕⡕⡕
⡣⡣⡣⡣⡣⡣⡣⡣⡣⡫⣪⢺⡸⣕⣕⢧⡳⣝⢮⢗⡯⡯⡾⣝⣗⡯⣞⣗⣟⣾⡏⡇⢎⠌⠌⠠⠑⡽⣽⣻⣺⡺⣝⢕⡵⣽⣺⡳⡑⣜⢼⣸⣸⡰⣱⢵⢱⢘⠌⠄⡐⢀⠁⠠⠐⡈⣪⢺⢽⣻⡾⡯⡯⣗⣯⣻⣺⡺⣕⢯⡫⡮⡳⣝⢮⢳⢝⡜⡎⡇⡇⡇⡇⡇⡣⡱⡱⡑⡕
⡱⡱⡱⡱⡱⡕⡵⡹⡸⡱⡕⡧⡳⣕⢮⢳⡹⡪⣏⢷⢽⢝⣽⡺⡮⡯⣗⣟⡾⣷⢕⠪⡢⠡⡈⠄⠡⣻⣺⢵⢯⣟⣾⣽⢽⢾⢽⣣⠣⠳⣝⣷⣳⢯⡳⡝⡜⡰⡑⡡⠐⠀⡈⠄⢅⢂⢇⢯⣿⣟⣯⡿⣽⣳⣳⡳⣳⢝⣞⡵⣫⢏⢯⢎⣗⢝⡎⡞⡜⡎⡎⡎⡎⡪⡊⡎⡜⡜⢜
⡸⡸⡸⡪⡣⡳⣱⢹⢜⡕⣝⢜⢮⢺⢜⢵⡹⡝⡮⡳⡽⣕⢷⢽⢽⢝⣗⣯⢿⡯⡲⡑⡌⠂⠌⠂⠅⣳⢽⢽⡽⣞⡷⡽⡽⣽⣻⡎⡎⠜⡺⣺⢽⢽⢕⢕⠕⡌⡒⠄⠁⠄⡀⠂⡅⡪⣎⣿⣿⣻⣯⣿⣳⣗⣗⡯⣗⢯⢞⡮⣳⢝⡵⣝⢼⡱⡕⣝⢜⢜⢜⢜⢜⢜⠜⡌⡎⡜⡜
⡱⡱⡕⡵⡹⡜⡎⡮⡪⡎⡎⣇⢗⢵⢹⢜⢎⢮⢳⡹⣺⡪⡯⣞⡽⣽⣺⢽⢯⣿⣝⣓⠌⢌⠨⡨⠨⢸⢽⡯⣯⣗⣟⢼⣽⣺⠳⠝⠠⠡⡳⣝⢽⢝⢎⢎⢪⢘⢌⠐⠀⠂⠄⢅⢢⣳⡿⣟⣿⣿⣽⣾⣳⣗⣟⡾⡽⡽⣕⢯⢮⡳⣝⢜⢮⡪⡺⡸⡸⡸⡸⡸⡸⡰⡱⡱⡑⡕⡜
⡣⡣⡇⡧⡣⡇⡗⡕⡇⡗⡝⡜⡜⣜⢼⢸⡱⡝⡮⣺⡪⣞⣽⡺⣽⣺⣺⢽⢯⢾⡽⣾⡸⡀⡢⢡⠣⠈⡯⣟⣗⢗⣞⡽⣺⡪⢝⠌⡆⢕⢍⢞⢕⢏⢎⢢⢑⠕⡐⠀⠡⠂⡁⢆⢳⢽⡿⣿⣻⡾⣷⢯⣷⣟⣾⢽⡽⣽⡺⡽⡵⣝⢼⡱⡣⡳⡹⡸⡱⡱⡱⡱⡱⡑⡕⡕⢕⢕⢕
⡜⡜⡜⡜⡜⡜⡜⡜⡜⡜⡜⡜⡜⡜⣜⢜⡜⡮⣺⡪⣞⡗⣗⣽⣺⣺⡺⡽⣝⣗⢯⣟⡯⡢⢐⢅⠅⠌⠜⢽⣺⡳⣳⢹⢑⢅⢑⠨⡈⡂⠅⡊⠢⡑⢌⠢⡑⡈⢀⠀⠅⡁⡂⡘⢜⢽⢯⡯⣯⣟⣯⣿⣳⣟⡾⣯⣟⡮⣯⡳⣝⢮⣣⢳⢹⢸⢸⢸⢸⠸⣘⢌⢎⢪⢪⢸⢘⢌⢎
⡎⡎⡎⡎⡎⡎⡎⡎⡎⡎⡎⡎⡮⡪⡎⡮⢮⡳⡳⣝⡞⣞⡵⣳⢵⡳⡽⣝⣞⢮⣻⡺⡯⡇⠇⢌⠠⠈⠌⠌⢺⢝⣜⢮⡺⣽⡱⣝⢌⢆⢕⠨⢌⢐⠐⠅⠂⡀⠄⠐⠀⡂⠂⠌⡨⠫⠻⡺⣳⢽⢾⣺⣗⣯⣟⣗⡷⡯⡷⣝⣗⢽⢜⢵⡹⡜⡎⡎⡎⡎⡎⡎⡎⡎⡆⡇⡇⡇⡇
⢣⢣⢣⢣⢣⢣⢣⢣⢣⢳⢹⢸⢪⡺⣪⢫⡳⡹⣝⢮⡺⡵⣫⡳⣝⣞⠽⡚⡪⡩⠢⠡⡩⡊⠜⢀⠢⠐⠈⠌⡀⡣⡊⢎⢞⣗⢯⢮⢪⢎⠎⡪⠐⢀⠁⢁⠠⠀⠀⠄⠁⡀⠂⠁⠌⠨⢐⠈⠌⠍⠫⡺⢞⡷⡽⡾⣽⢽⢽⣺⡪⣗⢽⢕⣕⢧⢳⢱⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢵
⠪⡊⡎⡪⡪⡪⡪⡪⢕⢕⢕⢧⢳⡱⡕⡗⣝⢝⡼⢵⢝⣝⠮⢫⢊⠢⡑⠌⢔⢐⠡⠡⠢⠨⡈⠄⢐⠨⢐⠠⠈⡢⡊⢌⠪⡪⢝⢜⠜⠔⡑⠀⠂⠄⠐⠀⢀⠀⠂⠀⠂⠀⡈⢀⠁⡈⠄⠨⢈⠌⠌⠄⢕⠨⡙⢝⢗⡯⣟⢮⢯⡺⣕⢗⢵⢕⢇⢗⢕⢵⢱⢕⢕⢕⢕⢕⢕⡕⡵
⡇⡣⡱⢱⢘⢌⢎⢪⢪⢪⢣⢣⡣⣣⢳⡹⣜⢵⢝⡕⢏⠢⠩⡂⠢⡁⡂⠅⡂⢂⠅⠅⠅⡑⠠⡁⡂⡂⠔⠈⡐⢀⢘⠐⡈⠢⡡⡡⠈⠠⠀⠌⠠⠁⠂⠁⠀⠀⠄⠁⡀⠁⡀⠠⢀⠐⡈⢐⠠⢂⠡⢑⠠⠡⡈⡢⠡⡩⢳⡫⣗⢽⡪⡯⡺⣪⢳⡹⡜⣎⢮⢪⢎⢇⢗⢕⢇⢇⢇
⠨⡢⠪⡪⢸⢨⢪⠪⡪⡪⡪⡪⡪⡪⡎⣞⣜⢎⢇⠪⠢⠡⡑⠠⡁⢂⠂⠌⠄⠅⢂⠡⢁⢊⠐⠄⠢⠐⡁⠅⡀⠂⠐⠈⠄⡑⠠⠡⢁⢁⠐⢈⠀⠐⠀⠐⠈⠀⡀⠂⠠⠐⢀⠐⡀⢂⠐⡀⠂⠔⠐⡐⠠⢁⢂⠂⠅⡂⢅⠝⢮⡳⣝⢮⡫⡮⣣⢳⢕⢵⢕⢇⢯⢪⡣⡳⡱⡝⡼
⡱⡨⢣⠪⡊⡎⡢⡣⢣⠪⡪⡪⡪⣪⢺⢜⠆⡅⠢⡃⠡⡁⡂⠅⢂⠐⡈⠄⠅⠌⢐⠨⢐⠀⡊⠨⡈⡐⡀⡂⡂⠡⠁⠌⡀⠄⠁⡊⠠⠀⠌⠀⡀⠁⡀⠂⠐⠀⠠⠐⠀⢂⠠⠐⢀⠐⡀⢂⠡⠨⠐⠠⢁⠢⠐⡨⢐⠨⢐⠨⠨⡺⣪⡳⡝⡮⡮⡳⡝⡮⣪⢳⢕⢧⢳⡹⣪⢺⢜
⡔⢕⢱⢑⠕⡅⢇⢎⢎⢎⢎⢎⢎⢮⡚⢔⠑⢌⠂⢌⠐⠄⢂⠨⠀⡂⠔⠈⠄⠅⡂⠂⡂⠌⠄⡁⡂⢐⢐⠠⠂⠅⠌⡂⢐⠠⠁⠄⢁⠐⠀⠄⠠⠀⠠⠐⠈⠀⢂⠠⠁⠄⠐⢈⠀⡂⢐⠀⡂⠌⠠⠑⡀⢂⠡⠐⡀⢂⠂⠌⡂⡂⡪⡺⣝⢞⢮⡫⣞⢝⡼⣕⡝⣎⢧⢳⡱⡣⡏
⢕⠕⡅⡣⡣⡱⡱⢱⢸⢰⢱⢱⢱⠕⢌⠢⠡⡁⡂⠡⢈⠐⡀⢂⢁⠐⡈⠌⠠⡁⡐⠡⢐⠈⠔⢐⠐⡐⠠⠨⠐⡁⡂⡂⢂⠂⡁⡐⢀⠂⢁⠐⡀⢈⠠⠐⠈⠠⠀⠄⠂⡈⢈⠠⠐⢀⠂⡐⠠⠨⠀⠅⡐⠄⠌⢐⠐⠠⢈⢐⠠⢂⢂⢙⢮⢏⣗⢽⡪⣗⣝⢖⡽⡜⣎⢧⡳⣹⢪
⢊⢎⢜⢌⢆⢇⢎⢎⢆⢇⢇⢇⢇⠕⡡⠨⠐⡀⢂⠡⠐⡀⢂⠐⡀⢂⠄⠅⠡⠀⠔⠈⠄⢂⢁⢂⠡⠨⠠⠁⢅⠂⡐⡀⡂⡐⢀⠂⠄⢂⠐⡀⢐⠀⠄⠂⡈⠄⡈⢀⠁⠄⠂⢐⠈⠠⠐⠠⢈⠐⡈⠄⡐⢐⢈⢀⠂⠡⠐⡀⢊⠐⠠⢂⠹⣕⢯⣳⢽⡺⣜⣗⣝⢮⡳⡵⣹⢪⡳
⡑⡕⡜⡌⡆⡇⡕⡜⡜⢬⢒⢕⡑⡰⠠⠡⠈⢄⢁⠂⠡⠐⢐⠐⢐⢀⠂⡡⠈⠄⠅⠌⠄⠡⢐⠠⠨⠠⢁⠊⡠⠂⡐⠠⠐⡀⠂⠌⡐⡀⢂⠐⡀⠂⠄⡁⠄⠐⠠⠐⢈⠠⠈⠄⠂⢁⠂⠡⠀⡂⡐⡀⢂⠐⠠⠐⡈⠄⠅⢐⠠⠁⠌⠠⡈⡺⣽⣪⣗⣟⣞⡼⣪⣗⢽⡪⣗⡳⣝
⢜⠬⡢⡣⡣⡣⡣⡣⡣⡣⡣⡣⡊⠄⢊⠐⡁⠂⠔⡈⠄⠡⠂⡨⠀⡂⡐⠠⢊⠠⠁⠌⠄⠡⠐⡐⠈⠔⠠⠁⡂⠂⡂⡁⠅⠠⠑⢐⠠⢐⠠⠂⢂⠁⡂⠐⡀⠅⠨⠐⡀⠄⡁⠂⡁⡐⠈⡐⢀⠂⡐⠀⡂⠨⠀⠅⡐⠠⠈⠄⠄⠡⢈⠐⡐⠨⣳⣳⡳⣵⣳⢽⡳⣵⡫⣯⡺⣺⣪
⢎⢎⢎⢎⢎⢎⢎⢎⢎⢎⢎⡪⠐⡁⡂⠂⡂⢁⠅⢂⢑⠨⠐⡀⡂⢂⠐⡈⠄⢂⠡⠈⠌⠨⠐⡠⠡⠁⠅⡁⡂⠡⠠⢐⢈⠨⢈⢀⠂⡐⠐⡈⠄⢐⠠⢁⠐⢈⠐⠐⡀⠂⠄⠡⠀⢄⠡⠐⢀⠂⠄⡁⡐⠨⠀⠅⠠⠁⠌⠐⡈⠐⡀⠂⠄⠅⢵⣳⢯⢷⣝⣗⣟⢮⢯⣞⣞⢵⣣
⢸⢸⢸⢸⢸⢸⢸⢸⢸⢪⠣⡊⢂⢂⠂⠅⡐⠠⠂⡡⢀⢂⠡⠀⡂⢐⠀⡂⠌⡀⢂⠡⠈⠄⠅⡐⢈⠄⡑⠠⡈⠨⢐⠠⢐⠀⡂⢐⠐⢀⠡⠠⠈⠄⢂⠠⢈⠠⠨⠐⡀⠅⠨⠀⠅⢂⠐⡈⢀⠂⡁⠄⢂⢈⠨⠀⠅⡈⠄⠡⠀⠂⠄⡁⢂⢁⢊⣯⢯⣷⣳⢷⢽⡽⣳⣳⡳⡯⡾
⢱⢱⢱⢱⢱⢱⢱⡱⡕⡇⢕⢈⢂⠂⠌⡐⠠⠁⠌⡐⠄⡂⠄⠡⠐⢀⠂⢂⠐⢐⠀⡂⡁⠅⢂⠐⡐⡀⡂⢁⠂⠡⠐⠐⡀⢂⠐⠠⠈⠠⠐⡀⠅⠂⡐⢀⠂⡐⢐⠠⠐⠈⠄⡁⢂⠐⡀⡂⢐⠠⠐⢀⠂⠄⢐⠀⡁⠄⢀⠡⠈⠐⡀⢂⠠⢀⠂⢽⢽⢾⢽⢯⢿⢽⣻⣺⡽⣯⣻
================================================================================================ ]]
