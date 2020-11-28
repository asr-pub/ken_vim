set enc=utf-8
set nocompatible
source $VIMRUNTIME/vimrc_example.vim


" 关闭自动备份，打开撤销记录（可以跨会话撤销），并将撤销记录文件存储于 ~/.vim/undodir 中
set nobackup
set undodir=~/.vim/undodir

if !isdirectory(&undodir)
  call mkdir(&undodir, 'p', 0700)
endif

" 鼠标选中文本即是复制
set mouse=

set fileencodings=ucs-bom,utf-8,gb18030,latin1

" 解决在老版本 vim 中粘贴出现格式错乱的问题
if !has('patch-8.0.210')
  " 进入插入模式时启用括号粘贴模式
  let &t_SI .= "\<Esc>[?2004h"
  " 退出插入模式时停用括号粘贴模式
  let &t_EI .= "\<Esc>[?2004l"
  " 见到 <Esc>[200~ 就调用 XTermPasteBegin
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

  function! XTermPasteBegin()
    " 设置使用 <Esc>[201~ 关闭粘贴模式
    set pastetoggle=<Esc>[201~
    " 开启粘贴模式
    set paste
    return ""
  endfunction
endif
