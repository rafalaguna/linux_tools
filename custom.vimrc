set background=dark

set autoindent
set tabstop=2
set number
set ruler
"set cursorline
set guioptions-=T
"set splitbelow
"set splitright
set showmatch

"let g:github_user = $GITHUB_USER
"let g:github_token = $GITHUB_TOKEN
"let g:gist_detect_filetype = 1
"let g:gist_open_browser_after_post = 1

autocmd BufWinEnter * highlight ColorColumn ctermbg=lightgreen
set colorcolumn=80


if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
