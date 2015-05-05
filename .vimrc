"____________States: tags, plugins, alias __________________


" window size
set lines=43


"" status line
"" statusline
"" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"" format markers:
""   %< truncation point
""   %n buffer number
""   %f relative path to file
""   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
""   %r readonly flag [RO]
""   %y filetype [ruby]
""   %= split point for left and right justification
""   %-35. width specification
""   %l current line number
""   %L number of lines in buffer
""   %c current column number
""   %V current virtual column number (-n), if different from %c
""   %P percentage through buffer
""   %) end of width specification
set statusline=%{fugitive#statusline()}

set runtimepath+=~/vim/runtime/syntax,$VIMRUNTIME

"" %<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

"" try to detect filetypes
"" filetype on 
"" filetype plugin indent on    

""enable loading indent file for filetype

"" __________fugitive________________
"" ___extract any plugin to ~/.vim/bundle ____~/.vim/autoload/pathogen.vim
"" ___added to the 'runtimepath'_______set runtimepath?
"" ___:Helptags to run :helptags on every doc/ directory in your 'runtimepath'. 
"" :set runtimepath?
"" /bin/bash: :set: command not found
"" /bin/bash: $'\026:set': command not found
"" /bin/bash: $'\026': command not found
"" /bin/bash: :set: command not found
"" /bin/bash: $'\026': command not found
"" /bin/bash: $'\026': command not found
"" /"pset runtimepath?
"" /bin/bash: $'\026': command not found
"" #call pathogen#infect()

set shell=sh
execute pathogen#infect('bundle/{}', '~/vim/runtime/{}')
filetype off
syntax on
filetype plugin indent on

echom "debug"
set nocompatible

"" set sessionoptions-=options

""markdown
""au BufRead,BufNewFile *.md set filetype=markdown


""vimwiki


"____CTAGS____

set tags=./tags;/
map <M-h> <C-T>
map <M-l> <C-]>

""taglist_vim plugin
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
let Tlist_Use_Right_Window   = 1
nnoremap <F3> :TlistToggle<CR>

"latex taglist 
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'
command! -nargs=1 Function call s:Function\(<f-args>\) 

"auto build ctag list in directory
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" code-tag-completion
inoremap <c-x><c-]> <c-]>

"dynamic tags (only append), need autotags with vim-python support to remove
autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('ctags -a '.expand('%')) |
      \ endif

"todo tags
command! TODO tselect /^TODO
if has("autocmd")
	" Highlight TODO, FIXME, NOTE, etc.
	if v:version > 701
		autocmd Syntax * call matchadd('Todo','\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
		autocmd Syntax * call matchadd('Debug','\W\zs\(NOTE\|INFO\|IDEA\)')
	endif
endif


"______range: state descriptor, adj., txt_______________

"fold-method toggle/space
nnoremap <space> za
vnoremap <space> zf
"make views automatic for saving fold state
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
set foldmethod=manual
"za toggle, zM/R toggle everythind
"set foldmethod=indent
"set foldlevel=99
"folding settings
"set foldmethod=indent   "fold based on indent
"set foldnestmax=100     "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use

""title
set title

""COLOR:
"256colors to overwrite terminal background
"set at terminal with :colo gardener, inkpot, desert256, 256-grayvim, xoria256
if $COLORTERM == 'gnome-terminal' | set t_Co=256 | endif
"set t_Co=256

"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
"bright, gardener comments dim, desert256 comments lit
"light, but brighter 256-grayvim
"dark, xoria256 dark purples, inkpot dark but white font
colorscheme gardener 
nnoremap <localleader>1 :colo gardener<CR>
nnoremap <localleader>2 :colo desert256<CR>
nnoremap <localleader>3 :call C3lr()<CR>
nnoremap <localleader>4 :colo vividchalk<CR>
nnoremap <localleader>5 :colo inkpot<CR>
nnoremap <localleader>6 :call White()<CR>

function! White()
	:colo shine
	:colo earendel
endfunction

function! C3lr()
	" console vim resize
	" good for slides/writing
	"position form top left corner	
	:colo 256-grayvim	
	:winpos 0 800
	if exists("+lines")
		set lines=50
	endif
	if exists("+columns")
		set columns=87
	endif
endfunction


"
"hi normal       term=NONE
"hi normal ctermfg=grey  ctermbg=black   guifg=grey  guibg=black
"hi comment   ctermfg=cyan   ctermbg=black
""highlight Normal ctermfg=grey ctermbg=darkblue
""highlight Normal ctermfg=black ctermbg=white


"___________verbs: function, shortcuts_________________

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"tab-complete
set wildmode=longest,list,full
set wildmenu

"shortcuts
nmap Y y$
nmap <C-J> :bnext<CR>
nmap <C-K> :bprev<CR>
nmap <C-L> :tabn<CR>
nmap <C-H> :tabp<CR>

"buffer-navigation
"list buffer, switch by # or name
:nnoremap <F5> :buffers<CR>:buffer<Space> 
"cycle through buffers
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
"ignore SWAPFILE
:set hidden

"splits
set splitbelow
set splitright
map - <C-W>-
map + <C-W>+
"vsplit other.fil
map <M-<> <C-W><
map <M->> <C-W>>

"auto-save
set updatetime=30000
au CursorHold * :w


"_____objects/functional: args, motions, adverbs/modifier______

" Mucking with no cursor movement on escape from insert mode
let CursorColumnI = 0 "the cursor column position in INSERT
augroup inserttweak
	autocmd!
	autocmd InsertEnter * let CursorColumnI = col('.')
	autocmd CursorMovedI * let CursorColumnI = col('.')
	autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif
augroup END 


"abbreviations
"iab 

"DOCCO: function to append </br>
so /home/solver/util1/vimscript/todo.vim
nnoremap <localleader>td :call TodoPrepend()<CR>
nnoremap <localleader>td. :call TodoPrependDot()<CR>
nnoremap <localleader>br m'A<C-R>="\t"."<br>"<CR><Esc>`` 
nnoremap <localleader>kwl m'A<C-R>="\t"."#<a knowl=\"k .html\">kwl</a>"<CR><Esc>`` 

"function to write date to end of line
nnoremap <F4> m'A<C-R>="\t".strftime('%Y-%m-%d %H:%M:%S')<CR><Esc>``
"function to show todo_tags
"nnoremap <localleader>2 :call VimTODO()<cr>  //to be implemented

"YOGA
so /home/solver/tennis/yoga.vim
"function to show yoga_template
nnoremap <localleader>yg :call Yogapre()<cr>


"TAGS
"if has("autocmd")
	  " Highlight TODO, FIXME, NOTE, etc.
	  "   if v:version > 701
	  "       autocmd Syntax * call matchadd('Todo',
	  "       '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
	  "           autocmd Syntax * call matchadd('Debug',
	  "           '\W\zs\(NOTE\|INFO\|IDEA\)')
	  "             endif
	  "             endif


"backup directory
silent execute '!mkdir -p ~/.vim_backups'
set backupdir=~/.vim_backups//
set directory=~/.vim_backups//

"vimgrep quickfix navigation
noremap <F11> :cp<CR>
noremap <F12> :cn<CR>
noremap <S-F11> :cpf<CR>
noremap <S-F12> :cnf<CR>
noremap <C-F11> :col<CR>
noremap <C-F12> :cnew<CR>


map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
nmap <leader>n :NERDTreeToggle<CR>
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
nmap <leader>t :tabnew <CR>
map <leader>d :r !date<CR>

let NERDTreeShowHidden=1

set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set vb t_vb=
set ruler
set background=dark

set nocompatible      " Use Vim defaults (much better!)
  set bs=2              " allow backspacing over everything in insert mode
    set backup            " keep a backup file
      set viminfo='20,\"100 " read/write a .viminfo file, don't store more
        set history=50                " keep 50 lines of command line history
	  set ruler             " show the cursor position all the time


let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
	  set t_ts=^[k
	    set t_fs=^[\
	endif
	if &term == "screen" || &term == "xterm"
		  set title
	  endif

let g:pyflakes_use_quickfix = 0

let g:pep8_map='<leader>8'

set completeopt=menuone,longest,preview





"%{fugitive#statusline()}


""" Tomorrow Night - Full Colour and 256 Colour
""" http://chriskempson.com
"""
""" Hex colour conversion functions borrowed from the theme "Desert256""
""
""" Default GUI Colours
""let s:foreground = "c5c8c6"
""let s:background = "1d1f21"
""let s:selection = "373b41"
""let s:line = "282a2e"
""let s:comment = "969896"
""let s:red = "cc6666"
""let s:orange = "de935f"
""let s:yellow = "f0c674"
""let s:green = "b5bd68"
""let s:aqua = "8abeb7"
""let s:blue = "81a2be"
""let s:purple = "b294bb"
""let s:window = "4d5057"
""
""" Console 256 Colours
""if !has("gui_running")
""let s:background = "303030"
""let s:window = "5e5e5e"
""let s:line = "3a3a3a"
""let s:selection = "585858"
""end
""
""set background=dark
""hi clear
""syntax reset
""
""let g:colors_name = """Tomorrow-Night"
""
""if has("gui_running") || &t_Co == 88 || &t_Co == 256
""" Returns an approximate grey index for the given grey level
""fun <SID>grey_number(x)
""if &t_Co == 88
""if a:x < 23
""return 0
""elseif a:x < 69
""return 1
""elseif a:x < 103
""return 2
""elseif a:x < 127
""return 3
""elseif a:x < 150
""return 4
""elseif a:x < 173
""return 5
""elseif a:x < 196
""return 6
""elseif a:x < 219
""return 7
""elseif a:x < 243
""return 8
""else
""return 9
""endif
""else
""if a:x < 14
""return 0
""else
""let l:n = (a:x - 8) / 10
""let l:m = (a:x - 8) % 10
""if l:m < 5
""return l:n
""else
""return l:n + 1
""endif
""endif
""endif
""endfun
""
""" Returns the actual grey level represented by the grey index
""fun <SID>grey_level(n)
""if &t_Co == 88
""if a:n == 0
""return 0
""elseif a:n == 1
""return 46
""elseif a:n == 2
""return 92
""elseif a:n == 3
""return 115
""elseif a:n == 4
""return 139
""elseif a:n == 5
""return 162
""elseif a:n == 6
""return 185
""elseif a:n == 7
""return 208
""elseif a:n == 8
""return 231
""else
""return 255
""endif
""else
""if a:n == 0
""return 0
""else
""return 8 + (a:n * 10)
""endif
""endif
""endfun
""
""" Returns the palette index for the given grey index
""fun <SID>grey_colour(n)
""if &t_Co == 88
""if a:n == 0
""return 16
""elseif a:n == 9
""return 79
""else
""return 79 + a:n
""endif
""else
""if a:n == 0
""return 16
""elseif a:n == 25
""return 231
""else
""return 231 + a:n
""endif
""endif
""endfun
""
""" Returns an approximate colour index for the given colour level
""fun <SID>rgb_number(x)
""if &t_Co == 88
""if a:x < 69
""return 0
""elseif a:x < 172
""return 1
""elseif a:x < 230
""return 2
""else
""return 3
""endif
""else
""if a:x < 75
""return 0
""else
""let l:n = (a:x - 55) / 40
""let l:m = (a:x - 55) % 40
""if l:m < 20
""return l:n
""else
""return l:n + 1
""endif
""endif
""endif
""endfun
""
""" Returns the actual colour level for the given colour index
""fun <SID>rgb_level(n)
""if &t_Co == 88
""if a:n == 0
""return 0
""elseif a:n == 1
""return 139
""elseif a:n == 2
""return 205
""else
""return 255
""endif
""else
""if a:n == 0
""return 0
""else
""return 55 + (a:n * 40)
""endif
""endif
""endfun
""
""" Returns the palette index for the given R/G/B colour indices
""fun <SID>rgb_colour(x, y, z)
""if &t_Co == 88
""return 16 + (a:x * 16) + (a:y * 4) + a:z
""else
""return 16 + (a:x * 36) + (a:y * 6) + a:z
""endif
""endfun
""
""" Returns the palette index to approximate the given R/G/B colour levels
""fun <SID>colour(r, g, b)
""" Get the closest grey
""let l:gx = <SID>grey_number(a:r)
""let l:gy = <SID>grey_number(a:g)
""let l:gz = <SID>grey_number(a:b)
""
""" Get the closest colour
""let l:x = <SID>rgb_number(a:r)
""let l:y = <SID>rgb_number(a:g)
""let l:z = <SID>rgb_number(a:b)
""
""if l:gx == l:gy && l:gy == l:gz
""" There are two possibilities
""let l:dgr = <SID>grey_level(l:gx) - a:r
""let l:dgg = <SID>grey_level(l:gy) - a:g
""let l:dgb = <SID>grey_level(l:gz) - a:b
""let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
""let l:dr = <SID>rgb_level(l:gx) - a:r
""let l:dg = <SID>rgb_level(l:gy) - a:g
""let l:db = <SID>rgb_level(l:gz) - a:b
""let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
""if l:dgrey < l:drgb
""" Use the grey
""return <SID>grey_colour(l:gx)
""else
""" Use the colour
""return <SID>rgb_colour(l:x, l:y, l:z)
""endif
""else
""" Only one possibility
""return <SID>rgb_colour(l:x, l:y, l:z)
""endif
""endfun
""
""" Returns the palette index to approximate the 'rrggbb' hex string
""fun <SID>rgb(rgb)
""let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
""let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
""let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
""
""return <SID>colour(l:r, l:g, l:b)
""endfun
""
""" Sets the highlighting for the given group
""fun <SID>X(group, fg, bg, attr)
""if a:fg != ""
""exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
""endif
""if a:bg != ""
""exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
""endif
""if a:attr != ""
""exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
""endif
""endfun
""
""" Vim Highlighting
""call <SID>X("Normal", s:foreground, s:background, "")
""call <SID>X("LineNr", s:selection, "", "")
""call <SID>X("NonText", s:selection, "", "")
""call <SID>X("SpecialKey", s:selection, "", "")
""call <SID>X("Search", s:background, s:yellow, "")
""call <SID>X("TabLine", s:foreground, s:background, "reverse")
""call <SID>X("StatusLine", s:window, s:yellow, "reverse")
""call <SID>X("StatusLineNC", s:window, s:foreground, "reverse")
""call <SID>X("VertSplit", s:window, s:window, "none")
""call <SID>X("Visual", "", s:selection, "")
""call <SID>X("Directory", s:blue, "", "")
""call <SID>X("ModeMsg", s:green, "", "")
""call <SID>X("MoreMsg", s:green, "", "")
""call <SID>X("Question", s:green, "", "")
""call <SID>X("WarningMsg", s:red, "", "")
""call <SID>X("MatchParen", "", s:selection, "")
""call <SID>X("Folded", s:comment, s:background, "")
""call <SID>X("FoldColumn", "", s:background, "")
""if version >= 700
""call <SID>X("CursorLine", "", s:line, "none")
""call <SID>X("CursorColumn", "", s:line, "none")
""call <SID>X("PMenu", s:foreground, s:selection, "none")
""call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
""call <SID>X("SignColumn", "", s:background, "none")
""end
""if version >= 703
""call <SID>X("ColorColumn", "", s:line, "none")
""end
""
""" Standard Highlighting
""call <SID>X("Comment", s:comment, "", "")
""call <SID>X("Todo", s:comment, s:background, "")
""call <SID>X("Title", s:comment, "", "")
""call <SID>X("Identifier", s:red, "", "none")
""call <SID>X("Statement", s:foreground, "", "")
""call <SID>X("Conditional", s:foreground, "", "")
""call <SID>X("Repeat", s:foreground, "", "")
""call <SID>X("Structure", s:purple, "", "")
""call <SID>X("Function", s:blue, "", "")
""call <SID>X("Constant", s:orange, "", "")
""call <SID>X("String", s:green, "", "")
""call <SID>X("Special", s:foreground, "", "")
""call <SID>X("PreProc", s:purple, "", "")
""call <SID>X("Operator", s:aqua, "", "none")
""call <SID>X("Type", s:blue, "", "none")
""call <SID>X("Define", s:purple, "", "none")
""call <SID>X("Include", s:blue, "", "")
"""call <SID>X("Ignore", "666666", "", "")
""
""" Vim Highlighting
""call <SID>X("vimCommand", s:red, "", "none")
""
""" C Highlighting
""call <SID>X("cType", s:yellow, "", "")
""call <SID>X("cStorageClass", s:purple, "", "")
""call <SID>X("cConditional", s:purple, "", "")
""call <SID>X("cRepeat", s:purple, "", "")
""
""" PHP Highlighting
""call <SID>X("phpVarSelector", s:red, "", "")
""call <SID>X("phpKeyword", s:purple, "", "")
""call <SID>X("phpRepeat", s:purple, "", "")
""call <SID>X("phpConditional", s:purple, "", "")
""call <SID>X("phpStatement", s:purple, "", "")
""call <SID>X("phpMemberSelector", s:foreground, "", "")
""
""" Ruby Highlighting
""call <SID>X("rubySymbol", s:green, "", "")
""call <SID>X("rubyConstant", s:yellow, "", "")
""call <SID>X("rubyAttribute", s:blue, "", "")
""call <SID>X("rubyInclude", s:blue, "", "")
""call <SID>X("rubyLocalVariableOrMethod", s:orange, "", "")
""call <SID>X("rubyCurlyBlock", s:orange, "", "")
""call <SID>X("rubyStringDelimiter", s:green, "", "")
""call <SID>X("rubyInterpolationDelimiter", s:orange, "", "")
""call <SID>X("rubyConditional", s:purple, "", "")
""call <SID>X("rubyRepeat", s:purple, "", "")
""
""" Python Highlighting
""call <SID>X("pythonInclude", s:purple, "", "")
""call <SID>X("pythonStatement", s:purple, "", "")
""call <SID>X("pythonConditional", s:purple, "", "")
""call <SID>X("pythonFunction", s:blue, "", "")
""
""" JavaScript Highlighting
""call <SID>X("javaScriptBraces", s:foreground, "", "")
""call <SID>X("javaScriptFunction", s:purple, "", "")
""call <SID>X("javaScriptConditional", s:purple, "", "")
""call <SID>X("javaScriptRepeat", s:purple, "", "")
""call <SID>X("javaScriptNumber", s:orange, "", "")
""call <SID>X("javaScriptMember", s:orange, "", "")
""
""" HTML Highlighting
""call <SID>X("htmlTag", s:red, "", "")
""call <SID>X("htmlTagName", s:red, "", "")
""call <SID>X("htmlArg", s:red, "", "")
""call <SID>X("htmlScriptTag", s:red, "", "")
""
""" Diff Highlighting
""call <SID>X("diffAdded", s:green, "", "")
""call <SID>X("diffRemoved", s:red, "", "")
""
""" ShowMarks Highlighting
""    call <SID>X("ShowMarksHLl", s:orange, s:background, "none")
""    call <SID>X("ShowMarksHLo", s:purple, s:background, "none")
""    call <SID>X("ShowMarksHLu", s:yellow, s:background, "none")
""    call <SID>X("ShowMarksHLm", s:aqua, s:background, "none")
""
""" Delete Functions
""delf <SID>X
""delf <SID>rgb
""delf <SID>colour
""delf <SID>rgb_colour
""delf <SID>rgb_level
""delf <SID>rgb_number
""delf <SID>grey_colour
""delf <SID>grey_level
""delf <SID>grey_number
""endif

