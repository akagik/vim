nmap <C-M> :w<CR>:!platex %<CR>:!dvipdfmx %<<CR>
nmap <F1> :!open %<.pdf<CR>

imap <C-T>i \\begin{itemize}<CR>\\item<CR>\\end{itemize}<ESC>kA\ 
imap <C-T>m \\begin{eqnarray*}<CR>\\end{eqnarray*}<ESC>O
imap <C-T>ra $\\rightarrow$ 
imap <C-T>f \\frac{}{} 

function! 
