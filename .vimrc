" Author: sanfusu@foxmail.com
" Date:	2019/6/8
" This .vimrc need some vim script to work, but itself can not corrupt your vim.

set nocompatible
filetype off

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/c.vim'
"Plugin 'kien/ctrlp.vim'
"Plugin 'ompugao/ctrlp-locate'
"LeaderF is much faser than ctrlp
Plugin 'Yggdroot/LeaderF'
"Plugin 'SpaceVim/cscope.vim'
"Plugin 'brookhong/cscope.vim'
Plugin 'rhysd/vim-clang-format'  
call vundle#end()
filetype plugin indent on

if has("extra_search")
	set hlsearch
endif

if !has("gui_running")
	if has('mouse')
		set mouse=a
		set ttymouse=sgr
	endif
	" set term=xterm " term determined by $TERM in env(bash)
	set nocompatible
endif
" let vim guess the background
" set background&
" or you can set it to dark or light manually
set background=dark

" cursorline highlight only for demonstrating not for coding!
if !exists("*ToggleCursorline")
	let s:toggleCursorlineFlag = 1
	function DeftcurlineGroup()
		augroup tcurline 
			au!
			au tcurline WinLeave * set nocursorline
			au tcurline WinEnter * set cursorline
		augroup END
	endfunction
	call DeftcurlineGroup()

	function ToggleCursorline()
		if s:toggleCursorlineFlag == 1
			au! tcurline WinLeave
			au! tcurline WinEnter
			set nocursorline
			let s:toggleCursorlineFlag=0
		else
			call DeftcurlineGroup()
			set cursorline
			let s:toggleCursorlineFlag = 1
		endif
	endfunction
	call ToggleCursorline() " close the cursorline 
				" highlight by default
	map <F2> :call ToggleCursorline()<CR>
endif

" set syntax and other style specified options
if has("syntax")
	syntax on
	set nu
	highlight CursorLine cterm=NONE 
				\ctermbg=red ctermfg=green 
				\guibg=NONE guifg=NONE
	"highlight CursorColumn cterm=NONE 
	"\ ctermbg=black ctermfg=green guibg=NONE guifg=NONE
endif

" Config for nerdtree
if &runtimepath =~ "nerdtree"
	"let NERDTreeWinPos='left'
	let NERDTreeWinSize=31
	"let NERDTreeWinSizeMax=3*NERDTreeWinSize
	let NERDTreeHighlightCursorline=0 	" Do it by mannual: 
						" call ToggleCursorline()
	"let NERDTreeAutoDeleteBuffer=1 	" May be dangerous
	"autocmd vimenter * NERDTree
	map <Leader><C-n> :NERDTreeToggle<CR>
endif

" Config for taglist
if &runtimepath =~ "taglist"
	let Tlist_Use_Right_Window=1
	let Tlist_Show_One_File=1
	let Tlist_Enable_Fold_Column=0
	let Tlist_Exit_OnlyWindow=1
	let Tlist_WinWidth=20
	nnoremap <Leader><C-t> :TlistToggle<CR>
endif

" Config for yankring
if &runtimepath =~ "YanKring"
	let g:yankring_replace_n_pkey=
	let g:yankring_replace_n_nkey=
endif

" Config for fuf
if &runtimepath =~ "FuzzyFinder"
	" despreciated due to LeaderF
	let g:fuf_modesDisable = []
	let g:fuf_mrufile_maxItem = 400
	let g:fuf_mrucmd_maxItem = 400
	nnoremap <silent> sj     :FufBuffer<CR>
	nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
	nnoremap <silent> sK     :FufFileWithFullCwd<CR>
	nnoremap <silent> s<C-k> :FufFile<CR>
	nnoremap <silent> sl     :FufCoverageFileChange<CR>
	nnoremap <silent> sL     :FufCoverageFileChange<CR>
	nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
	nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
	nnoremap <silent> sD     :FufDirWithFullCwd<CR>
	nnoremap <silent> s<C-d> :FufDir<CR>
	nnoremap <silent> sn     :FufMruFile<CR>
	nnoremap <silent> sN     :FufMruFileInCwd<CR>
	nnoremap <silent> sm     :FufMruCmd<CR>
	nnoremap <silent> su     :FufBookmarkFile<CR>
	nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
	vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
	nnoremap <silent> si     :FufBookmarkDir<CR>
	nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
	nnoremap <silent> st     :FufTag<CR>
	nnoremap <silent> sT     :FufTag!<CR>
	nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
	nnoremap <silent> s,     :FufBufferTag<CR>
	nnoremap <silent> s<     :FufBufferTag!<CR>
	vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
	vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
	nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
	nnoremap <silent> s.     :FufBufferTagAll<CR>
	nnoremap <silent> s>     :FufBufferTagAll!<CR>
	vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
	vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
	nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
	nnoremap <silent> sg     :FufTaggedFile<CR>
	nnoremap <silent> sG     :FufTaggedFile!<CR>
	nnoremap <silent> so     :FufJumpList<CR>
	nnoremap <silent> sp     :FufChangeList<CR>
	nnoremap <silent> sq     :FufQuickfix<CR>
	nnoremap <silent> sy     :FufLine<CR>
	nnoremap <silent> sh     :FufHelp<CR>
	nnoremap <silent> se     :FufEditDataFile<CR>
	nnoremap <silent> sr     :FufRenewCache<CR>
endif

if &runtimepath =~ 'ctrlp'
	"" this config is depreciated since LeaderF is faster.
	set wildignore+=*/.git/*
	let g:ctrlp_custom_ignore = {
				\ 'dir':  '\v[\/]\.(\w*)$',
				\ 'file': '\v\.(exe|so|dll)$',
				\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
				\ }
	if !exists("g:ctrlp_root_markers")
		let g:ctrlp_root_markers=[]
	endif
	call add(g:ctrlp_root_markers, '.project')
	let g:ctrlp_working_path_mode = 'cra'
endif

if &runtimepath =~ 'LeaderF'
	" Default:
	" <leader>f -> LeaderF file
	" <leader>b -> LeaderF buffer
	" This is the default config, but in case that
	let g:Lf_WildIgnore = {
				\ 'dir': ['.svn','.git','.hg'],
				\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
				\}
	" in case that you do not install powerline font
	let g:Lf_StlColorscheme = 'one'
	let g:Lf_StlSeparator = { 'left': '', 'right': '' }
endif


if has("cscope") && (executable('cscope') == 1)
"	set csprg=/usr/bin/cscope
"	set csto=0
"	set cst
"	set nocsverb
"	set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		echo 1
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
		echo 0
	endif
	set csverb

	nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>a :cs find a <C-R>=expand("<cword>")<CR><CR>

	nmap <C-_>hs :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>hg :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>hc :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>ht :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>he :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>hf :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>hi :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-_>hd :scs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>ha :scs find a <C-R>=expand("<cword>")<CR><CR>

	nmap <C-_>vs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>vg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>vc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>vt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>ve :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>vi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-_>vd :vert scs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>va :vert scs find a <C-R>=expand("<cword>")<CR><CR>
endif
