" From iijo.vim.

" This is the adapted default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Terminal colors
" #!/bin/bash
" for ((i=0; i<256; i++)); do
"     printf "\e[48;5;${i}m%03d" $i;
"     printf '\e[0m';
"     [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
" done
"
" or `showtermcolors`.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set background&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

" Colors from the bash excerpt above more or less match
" https://www.ditig.com/256-colors-cheat-sheet but not
" the colors from documentation syntax.txt.
"
" Xterm_Number Xterm_Name               HEX     RGB
" 0            Black_(SYSTEM)           #000000 rgb(0,0,0)
" 1            Maroon_(SYSTEM)          #800000 rgb(128,0,0)
" 2            Green_(SYSTEM)           #008000 rgb(0,128,0)
" 3            Olive_(SYSTEM)           #808000 rgb(128,128,0)
" 4            Navy_(SYSTEM)            #000080 rgb(0,0,128)
" 5            Purple_(SYSTEM)          #800080 rgb(128,0,128)
" 6            Teal_(SYSTEM)            #008080 rgb(0,128,128)
" 7            Silver_(SYSTEM)          #c0c0c0 rgb(192,192,192)
" 8            Grey_(SYSTEM)            #808080 rgb(128,128,128)
" 9            Red_(SYSTEM)             #ff0000 rgb(255,0,0)
" 10           Lime_(SYSTEM)            #00ff00 rgb(0,255,0)
" 11           Yellow_(SYSTEM)          #ffff00 rgb(255,255,0)
" 12           Blue_(SYSTEM)            #0000ff rgb(0,0,255)
" 13           Fuchsia(SYSTEM)          #ff00ff rgb(255,0,255)
" 14           Aqua_(SYSTEM)            #00ffff rgb(0,255,255)
" 15           White_(SYSTEM)           #ffffff rgb(255,255,255)
" 16           Grey0                    #000000 rgb(0,0,0)
" 17           NavyBlue                 #00005f rgb(0,0,95)
" 18           DarkBlue                 #000087 rgb(0,0,135)
" 19           Blue3                    #0000af rgb(0,0,175)
" 20           Blue3                    #0000d7 rgb(0,0,215)
" 21           Blue1                    #0000ff rgb(0,0,255)
" 22           DarkGreen                #005f00 rgb(0,95,0)
" 23           DeepSkyBlue4             #005f5f rgb(0,95,95)
" 24           DeepSkyBlue4             #005f87 rgb(0,95,135)
" 25           DeepSkyBlue4             #005faf rgb(0,95,175)
" 26           DodgerBlue3              #005fd7 rgb(0,95,215)
" 27           DodgerBlue2              #005fff rgb(0,95,255)
" 28           Green4                   #008700 rgb(0,135,0)
" 29           SpringGreen4             #00875f rgb(0,135,95)
" 30           Turquoise4               #008787 rgb(0,135,135)
" 31           DeepSkyBlue3             #0087af rgb(0,135,175)
" 32           DeepSkyBlue3             #0087d7 rgb(0,135,215)
" 33           DodgerBlue1              #0087ff rgb(0,135,255)
" 34           Green3                   #00af00 rgb(0,175,0)
" 35           SpringGreen3             #00af5f rgb(0,175,95)
" 36           DarkCyan                 #00af87 rgb(0,175,135)
" 37           LightSeaGreen            #00afaf rgb(0,175,175)
" 38           DeepSkyBlue2             #00afd7 rgb(0,175,215)
" 39           DeepSkyBlue1             #00afff rgb(0,175,255)
" 40           Green3                   #00d700 rgb(0,215,0)
" 41           SpringGreen3             #00d75f rgb(0,215,95)
" 42           SpringGreen2             #00d787 rgb(0,215,135)
" 43           Cyan3                    #00d7af rgb(0,215,175)
" 44           DarkTurquoise            #00d7d7 rgb(0,215,215)
" 45           Turquoise2               #00d7ff rgb(0,215,255)
" 46           Green1                   #00ff00 rgb(0,255,0)
" 47           SpringGreen2             #00ff5f rgb(0,255,95)
" 48           SpringGreen1             #00ff87 rgb(0,255,135)
" 49           MediumSpringGreen#00ffaf rgb(0,255,175)
" 50           Cyan2                    #00ffd7 rgb(0,255,215)
" 51           Cyan1                    #00ffff rgb(0,255,255)
" 52           DarkRed                  #5f0000 rgb(95,0,0)
" 53           DeepPink4                #5f005f rgb(95,0,95)
" 54           Purple4                  #5f0087 rgb(95,0,135)
" 55           Purple4                  #5f00af rgb(95,0,175)
" 56           Purple3                  #5f00d7 rgb(95,0,215)
" 57           BlueViolet               #5f00ff rgb(95,0,255)
" 58           Orange4                  #5f5f00 rgb(95,95,0)
" 59           Grey37                   #5f5f5f rgb(95,95,95)
" 60           MediumPurple4            #5f5f87 rgb(95,95,135)
" 61           SlateBlue3               #5f5faf rgb(95,95,175)
" 62           SlateBlue3               #5f5fd7 rgb(95,95,215)
" 63           RoyalBlue1               #5f5fff rgb(95,95,255)
" 64           Chartreuse4              #5f8700 rgb(95,135,0)
" 65           DarkSeaGreen4            #5f875f rgb(95,135,95)
" 66           PaleTurquoise4           #5f8787 rgb(95,135,135)
" 67           SteelBlue                #5f87af rgb(95,135,175)
" 68           SteelBlue3               #5f87d7 rgb(95,135,215)
" 69           CornflowerBlue           #5f87ff rgb(95,135,255)
" 70           Chartreuse3              #5faf00 rgb(95,175,0)
" 71           DarkSeaGreen4            #5faf5f rgb(95,175,95)
" 72           CadetBlue                #5faf87 rgb(95,175,135)
" 73           CadetBlue                #5fafaf rgb(95,175,175)
" 74           SkyBlue3                 #5fafd7 rgb(95,175,215)
" 75           SteelBlue1               #5fafff rgb(95,175,255)
" 76           Chartreuse3              #5fd700 rgb(95,215,0)
" 77           PaleGreen3               #5fd75f rgb(95,215,95)
" 78           SeaGreen3                #5fd787 rgb(95,215,135)
" 79           Aquamarine3              #5fd7af rgb(95,215,175)
" 80           MediumTurquoise          #5fd7d7 rgb(95,215,215)
" 81           SteelBlue1               #5fd7ff rgb(95,215,255)
" 82           Chartreuse2              #5fff00 rgb(95,255,0)
" 83           SeaGreen2                #5fff5f rgb(95,255,95)
" 84           SeaGreen1                #5fff87 rgb(95,255,135)
" 85           SeaGreen1                #5fffaf rgb(95,255,175)
" 86           Aquamarine1              #5fffd7 rgb(95,255,215)
" 87           DarkSlateGray2           #5fffff rgb(95,255,255)
" 88           DarkRed                  #870000 rgb(135,0,0)
" 89           DeepPink4                #87005f rgb(135,0,95)
" 90           DarkMagenta              #870087 rgb(135,0,135)
" 91           DarkMagenta              #8700af rgb(135,0,175)
" 92           DarkViolet               #8700d7 rgb(135,0,215)
" 93           Purple                   #8700ff rgb(135,0,255)
" 94           Orange4                  #875f00 rgb(135,95,0)
" 95           LightPink4               #875f5f rgb(135,95,95)
" 96           Plum4                    #875f87 rgb(135,95,135)
" 97           MediumPurple3            #875faf rgb(135,95,175)
" 98           MediumPurple3            #875fd7 rgb(135,95,215)
" 99           SlateBlue1               #875fff rgb(135,95,255)
" 100          Yellow4                  #878700 rgb(135,135,0)
" 101          Wheat4                   #87875f rgb(135,135,95)
" 102          Grey53                   #878787 rgb(135,135,135)
" 103          LightSlateGrey           #8787af rgb(135,135,175)
" 104          MediumPurple             #8787d7 rgb(135,135,215)
" 105          LightSlateBlue           #8787ff rgb(135,135,255)
" 106          Yellow4                  #87af00 rgb(135,175,0)
" 107          DarkOliveGreen3          #87af5f rgb(135,175,95)
" 108          DarkSeaGreen             #87af87 rgb(135,175,135)
" 109          LightSkyBlue3            #87afaf rgb(135,175,175)
" 110          LightSkyBlue3            #87afd7 rgb(135,175,215)
" 111          SkyBlue2                 #87afff rgb(135,175,255)
" 112          Chartreuse2              #87d700 rgb(135,215,0)
" 113          DarkOliveGreen3          #87d75f rgb(135,215,95)
" 114          PaleGreen3               #87d787 rgb(135,215,135)
" 115          DarkSeaGreen3            #87d7af rgb(135,215,175)
" 116          DarkSlateGray3           #87d7d7 rgb(135,215,215)
" 117          SkyBlue1                 #87d7ff rgb(135,215,255)
" 118          Chartreuse1              #87ff00 rgb(135,255,0)
" 119          LightGreen               #87ff5f rgb(135,255,95)
" 120          LightGreen               #87ff87 rgb(135,255,135)
" 121          PaleGreen1               #87ffaf rgb(135,255,175)
" 122          Aquamarine1              #87ffd7 rgb(135,255,215)
" 123          DarkSlateGray1           #87ffff rgb(135,255,255)
" 124          Red3                     #af0000 rgb(175,0,0)
" 125          DeepPink4                #af005f rgb(175,0,95)
" 126          MediumVioletRed          #af0087 rgb(175,0,135)
" 127          Magenta3                 #af00af rgb(175,0,175)
" 128          DarkViolet               #af00d7 rgb(175,0,215)
" 129          Purple                   #af00ff rgb(175,0,255)
" 130          DarkOrange3              #af5f00 rgb(175,95,0)
" 131          IndianRed                #af5f5f rgb(175,95,95)
" 132          HotPink3                 #af5f87 rgb(175,95,135)
" 133          MediumOrchid3            #af5faf rgb(175,95,175)
" 134          MediumOrchid             #af5fd7 rgb(175,95,215)
" 135          MediumPurple2            #af5fff rgb(175,95,255)
" 136          DarkGoldenrod            #af8700 rgb(175,135,0)
" 137          LightSalmon3             #af875f rgb(175,135,95)
" 138          RosyBrown                #af8787 rgb(175,135,135)
" 139          Grey63                   #af87af rgb(175,135,175)
" 140          MediumPurple2            #af87d7 rgb(175,135,215)
" 141          MediumPurple1            #af87ff rgb(175,135,255)
" 142          Gold3                    #afaf00 rgb(175,175,0)
" 143          DarkKhaki                #afaf5f rgb(175,175,95)
" 144          NavajoWhite3             #afaf87 rgb(175,175,135)
" 145          Grey69                   #afafaf rgb(175,175,175)
" 146          LightSteelBlue3          #afafd7 rgb(175,175,215)
" 147          LightSteelBlue           #afafff rgb(175,175,255)
" 148          Yellow3                  #afd700 rgb(175,215,0)
" 149          DarkOliveGreen3          #afd75f rgb(175,215,95)
" 150          DarkSeaGreen3            #afd787 rgb(175,215,135)
" 151          DarkSeaGreen2            #afd7af rgb(175,215,175)
" 152          LightCyan3               #afd7d7 rgb(175,215,215)
" 153          LightSkyBlue1            #afd7ff rgb(175,215,255)
" 154          GreenYellow              #afff00 rgb(175,255,0)
" 155          DarkOliveGreen2          #afff5f rgb(175,255,95)
" 156          PaleGreen1               #afff87 rgb(175,255,135)
" 157          DarkSeaGreen2            #afffaf rgb(175,255,175)
" 158          DarkSeaGreen1            #afffd7 rgb(175,255,215)
" 159          PaleTurquoise1           #afffff rgb(175,255,255)
" 160          Red3                     #d70000 rgb(215,0,0)
" 161          DeepPink3                #d7005f rgb(215,0,95)
" 162          DeepPink3                #d70087 rgb(215,0,135)
" 163          Magenta3                 #d700af rgb(215,0,175)
" 164          Magenta3                 #d700d7 rgb(215,0,215)
" 165          Magenta2                 #d700ff rgb(215,0,255)
" 166          DarkOrange3              #d75f00 rgb(215,95,0)
" 167          IndianRed                #d75f5f rgb(215,95,95)
" 168          HotPink3                 #d75f87 rgb(215,95,135)
" 169          HotPink2                 #d75faf rgb(215,95,175)
" 170          Orchid                   #d75fd7 rgb(215,95,215)
" 171          MediumOrchid1            #d75fff rgb(215,95,255)
" 172          Orange3                  #d78700 rgb(215,135,0)
" 173          LightSalmon3             #d7875f rgb(215,135,95)
" 174          LightPink3               #d78787 rgb(215,135,135)
" 175          Pink3                    #d787af rgb(215,135,175)
" 176          Plum3                    #d787d7 rgb(215,135,215)
" 177          Violet                   #d787ff rgb(215,135,255)
" 178          Gold3                    #d7af00 rgb(215,175,0)
" 179          LightGoldenrod3          #d7af5f rgb(215,175,95)
" 180          Tan                      #d7af87 rgb(215,175,135)
" 181          MistyRose3               #d7afaf rgb(215,175,175)
" 182          Thistle3                 #d7afd7 rgb(215,175,215)
" 183          Plum2                    #d7afff rgb(215,175,255)
" 184          Yellow3                  #d7d700 rgb(215,215,0)
" 185          Khaki3                   #d7d75f rgb(215,215,95)
" 186          LightGoldenrod2          #d7d787 rgb(215,215,135)
" 187          LightYellow3             #d7d7af rgb(215,215,175)
" 188          Grey84                   #d7d7d7 rgb(215,215,215)
" 189          LightSteelBlue1          #d7d7ff rgb(215,215,255)
" 190          Yellow2                  #d7ff00 rgb(215,255,0)
" 191          DarkOliveGreen1          #d7ff5f rgb(215,255,95)
" 192          DarkOliveGreen1          #d7ff87 rgb(215,255,135)
" 193          DarkSeaGreen1            #d7ffaf rgb(215,255,175)
" 194          Honeydew2                #d7ffd7 rgb(215,255,215)
" 195          LightCyan1               #d7ffff rgb(215,255,255)
" 196          Red1                     #ff0000 rgb(255,0,0)
" 197          DeepPink2                #ff005f rgb(255,0,95)
" 198          DeepPink1                #ff0087 rgb(255,0,135)
" 199          DeepPink1                #ff00af rgb(255,0,175)
" 200          Magenta2                 #ff00d7 rgb(255,0,215)
" 201          Magenta1                 #ff00ff rgb(255,0,255)
" 202          OrangeRed1               #ff5f00 rgb(255,95,0)
" 203          IndianRed1               #ff5f5f rgb(255,95,95)
" 204          IndianRed1               #ff5f87 rgb(255,95,135)
" 205          HotPink                  #ff5faf rgb(255,95,175)
" 206          HotPink                  #ff5fd7 rgb(255,95,215)
" 207          MediumOrchid1            #ff5fff rgb(255,95,255)
" 208          DarkOrange               #ff8700 rgb(255,135,0)
" 209          Salmon1                  #ff875f rgb(255,135,95)
" 210          LightCoral               #ff8787 rgb(255,135,135)
" 211          PaleVioletRed1           #ff87af rgb(255,135,175)
" 212          Orchid2                  #ff87d7 rgb(255,135,215)
" 213          Orchid1                  #ff87ff rgb(255,135,255)
" 214          Orange1                  #ffaf00 rgb(255,175,0)
" 215          SandyBrown               #ffaf5f rgb(255,175,95)
" 216          LightSalmon1             #ffaf87 rgb(255,175,135)
" 217          LightPink1               #ffafaf rgb(255,175,175)
" 218          Pink1                    #ffafd7 rgb(255,175,215)
" 219          Plum1                    #ffafff rgb(255,175,255)
" 220          Gold1                    #ffd700 rgb(255,215,0)
" 221          LightGoldenrod2          #ffd75f rgb(255,215,95)
" 222          LightGoldenrod2          #ffd787 rgb(255,215,135)
" 223          NavajoWhite1             #ffd7af rgb(255,215,175)
" 224          MistyRose1               #ffd7d7 rgb(255,215,215)
" 225          Thistle1                 #ffd7ff rgb(255,215,255)
" 226          Yellow1                  #ffff00 rgb(255,255,0)
" 227          LightGoldenrod1          #ffff5f rgb(255,255,95)
" 228          Khaki1                   #ffff87 rgb(255,255,135)
" 229          Wheat1                   #ffffaf rgb(255,255,175)
" 230          Cornsilk1                #ffffd7 rgb(255,255,215)
" 231          Grey100                  #ffffff rgb(255,255,255)
" 232          Grey3                    #080808 rgb(8,8,8)
" 233          Grey7                    #121212 rgb(18,18,18)
" 234          Grey11                   #1c1c1c rgb(28,28,28)
" 235          Grey15                   #262626 rgb(38,38,38)
" 236          Grey19                   #303030 rgb(48,48,48)
" 237          Grey23                   #3a3a3a rgb(58,58,58)
" 238          Grey27                   #444444 rgb(68,68,68)
" 239          Grey30                   #4e4e4e rgb(78,78,78)
" 240          Grey35                   #585858 rgb(88,88,88)
" 241          Grey39                   #626262 rgb(98,98,98)
" 242          Grey42                   #6c6c6c rgb(108,108,108)
" 243          Grey46                   #767676 rgb(118,118,118)
" 244          Grey50                   #808080 rgb(128,128,128)
" 245          Grey54                   #8a8a8a rgb(138,138,138)
" 246          Grey58                   #949494 rgb(148,148,148)
" 247          Grey62                   #9e9e9e rgb(158,158,158)
" 248          Grey66                   #a8a8a8 rgb(168,168,168)
" 249          Grey70                   #b2b2b2 rgb(178,178,178)
" 250          Grey74                   #bcbcbc rgb(188,188,188)
" 251          Grey78                   #c6c6c6 rgb(198,198,198)
" 252          Grey82                   #d0d0d0 rgb(208,208,208)
" 253          Grey85                   #dadada rgb(218,218,218)
" 254          Grey89                   #e4e4e4 rgb(228,228,228)
" 255          Grey93                   #eeeeee rgb(238,238,238)

" Alternatively for Normal, #0dcdcd.
hi Normal cterm=NONE gui=NONE ctermfg=245 guifg=#8a8a8a guibg=Grey4
hi Cursor cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE
hi CursorLine cterm=underline gui=underline ctermfg=NONE ctermbg=NONE
hi LineNrAbove cterm=NONE gui=NONE ctermfg=130 guifg=#af5f00 ctermbg=NONE
hi LineNr cterm=NONE gui=NONE ctermfg=3 guifg=olive ctermbg=NONE
hi LineNrBelow cterm=NONE gui=NONE ctermfg=130 guifg=#af5f00 ctermbg=NONE
hi CursorLineNR cterm=NONE gui=NONE ctermfg=130 guifg=#af5f00 ctermbg=NONE
hi CursorColumn cterm=NONE gui=NONE ctermfg=NONE ctermbg=7 guibg=#c0c0c0
hi FoldColumn cterm=NONE gui=NONE ctermfg=4 guifg=#0d73cc ctermbg=248 guibg=#a8a8a8  " 4 should correspond to #0d73cc
hi SignColumn cterm=NONE gui=NONE ctermfg=4 guifg=#0d73cc ctermbg=248 guibg=#a8a8a8
hi Folded cterm=NONE gui=NONE ctermfg=4 guifg=#0d73cc ctermbg=248 guibg=#a8a8a8
hi VertSplit cterm=reverse gui=reverse ctermfg=NONE ctermbg=NONE
hi ColorColumn cterm=NONE gui=NONE ctermfg=NONE ctermbg=224 guibg=#ffd7d7
hi TabLine cterm=underline gui=underline ctermfg=0 guifg=Black ctermbg=7 guibg=#c0c0c0
hi TabLineFill cterm=reverse gui=reverse ctermfg=NONE ctermbg=NONE
hi TabLineSel cterm=bold gui=bold ctermfg=NONE ctermbg=NONE
hi Directory cterm=NONE gui=NONE ctermfg=4 guifg=#0d73cc ctermbg=NONE
hi Search cterm=NONE gui=NONE ctermfg=NONE ctermbg=132 guibg=#af5f87
hi IncSearch cterm=reverse gui=reverse ctermfg=NONE ctermbg=NONE
hi StatusLine cterm=bold gui=bold ctermfg=NONE ctermbg=NONE
hi StatusLineNC cterm=reverse gui=reverse ctermfg=NONE ctermbg=NONE
hi WildMenu cterm=NONE gui=NONE ctermfg=0 guifg=Black ctermbg=11 guibg=Yellow
hi Question cterm=NONE gui=NONE ctermfg=2 guifg=#008000 ctermbg=NONE
hi Title cterm=NONE gui=NONE ctermfg=5 guifg=#800080 ctermbg=NONE
hi ModeMsg cterm=bold gui=bold ctermfg=NONE ctermbg=NONE
hi MoreMsg cterm=NONE gui=NONE ctermfg=2 guifg=#008000 ctermbg=NONE
hi MatchParen cterm=bold gui=bold ctermfg=NONE ctermbg=NONE
hi Visual cterm=NONE gui=NONE ctermfg=NONE ctermbg=7 guibg=#c0c0c0
hi VisualNOS cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE
hi NonText cterm=NONE gui=NONE ctermfg=12 guifg=Blue ctermbg=NONE
hi Todo cterm=NONE gui=NONE ctermfg=0 guifg=Black ctermbg=11 guibg=Yellow
hi Underlined cterm=underline gui=underline ctermfg=5 guifg=#800080 ctermbg=NONE
hi Error cterm=NONE gui=NONE ctermfg=15 guifg=White ctermbg=9 guibg=Red
hi ErrorMsg cterm=NONE gui=NONE ctermfg=15 guifg=White ctermbg=1 guibg=#800000
hi WarningMsg cterm=NONE gui=NONE ctermfg=1 guibg=#800000 ctermbg=NONE
hi Ignore cterm=NONE gui=NONE ctermfg=15 guifg=White ctermbg=NONE
hi SpecialKey cterm=NONE gui=NONE ctermfg=4 guifg=#0d73cc ctermbg=NONE
hi Constant cterm=NONE gui=NONE ctermfg=28 guifg=#008700 ctermbg=NONE
hi! link String Constant  " Force because already defined.
hi StringDelimiter cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE
hi! link Character Constant
hi Number cterm=NONE gui=NONE ctermfg=250 guifg=#bcbcbc ctermbg=NONE
hi! link Boolean Constant
hi! link Float Constant
" hi Identifier cterm=NONE gui=NONE ctermfg=6 guifg=#008080 ctermbg=NONE
hi! link Identifier Normal
hi Function cterm=NONE gui=NONE ctermfg=6 guifg=#008080 ctermbg=NONE
hi Statement cterm=NONE gui=NONE ctermfg=130 guifg=#af5f00 ctermbg=NONE
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Operator Statement
hi! link Keyword Statement
hi! link Exception Statement
" hi Comment cterm=NONE gui=NONE ctermfg=4 guifg=#0d73cc ctermbg=NONE font='Monaspace Radon,Monaspace Radon Light:style=Light,Regular'
" hi Comment cterm=italic gui=NONE ctermfg=4 guifg=#0d73cc ctermbg=NONE font='VictorMono Nerd Font Propo,VictorMono NFP Medium:style=Medium Italic,Italic'
hi Comment cterm=italic gui=italic ctermfg=4 guifg=#0d73cc ctermbg=NONE
hi Special cterm=NONE gui=NONE ctermfg=5 guifg=Grey ctermbg=NONE
hi! link SpecialChar Special
hi! link Tag Special
hi! link Delimiter Special
hi! link SpecialComment Special
hi! link Debug Special
hi PreProc cterm=NONE gui=NONE ctermfg=15 guifg=White ctermbg=NONE
hi Include ctermfg=28 guifg=#008700
hi! link Define Include
hi! link Macro PreProc
hi! link PreCondit PreProc
hi Type cterm=NONE gui=NONE ctermfg=2 guifg=#008000 ctermbg=NONE
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type
hi DiffAdd cterm=bold gui=bold ctermfg=221 guifg=#ffd75f ctermbg=NONE
hi DiffChange cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE
hi DiffDelete cterm=NONE gui=NONE ctermfg=236 guifg=#303030 ctermbg=NONE
hi DiffText cterm=bold gui=bold ctermfg=221 guifg=#ffd75f ctermbg=NONE
hi diffAdded cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE
hi diffChanged cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE
hi diffRemoved cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE
hi diffLine cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE
hi Pmenu cterm=NONE gui=NONE ctermfg=0 guifg=Black ctermbg=225 guibg=#ffd7ff
hi PmenuSel cterm=NONE gui=NONE ctermfg=0 guifg=Black ctermbg=7 guibg=#c0c0c0
hi PmenuSbar cterm=NONE gui=NONE ctermfg=NONE ctermbg=248 guibg=#a8a8a8
hi PmenuThumb cterm=NONE gui=NONE ctermfg=NONE ctermbg=0 guibg=Black
hi SpellBad cterm=undercurl gui=undercurl ctermfg=NONE ctermbg=NONE
hi SpellCap cterm=NONE gui=NONE ctermfg=NONE ctermbg=81 guibg=#5fd7ff
hi SpellLocal cterm=NONE gui=NONE ctermfg=NONE ctermbg=14 guibg=#00ffff
hi SpellRare cterm=NONE gui=NONE ctermfg=NONE ctermbg=225 guibg=#ffd7ff

hi DiagnosticFloatingError gui=NONE guibg=Grey23 guifg=White
" hi! link DiagnosticVirtualTextError DiagnosticError
" hi! link DiagnosticVirtualTextWarn DiagnosticWarn
" hi! link DiagnosticVirtualTextInfo DiagnosticInfo
" hi! link DiagnosticVirtualTextHint DiagnosticHint

" Treesitter highlighting.
hi @type.qualifier ctermfg=3 guifg=#808000
hi @constructor cterm=bold gui=bold ctermfg=245 guifg=#8a8a8a ctermbg=NONE
hi! link @field Identifier
hi! link @float Number
hi! link @function Function
hi! link @function.builtin Normal
hi! link @function.call Normal
hi! link @include Include
hi! link @namespace Normal
hi! link @operator Normal
hi! link @property Normal
hi! link @punctBracket Normal
hi! link @punctDelimiter Normal
hi! link @punctSpecial Normal
hi! link @punctuation.bracket Normal
hi! link @punctuation.delimiter Normal
hi! link @string String
hi! link @text.uri.html Normal
hi! link @type Normal
hi! link @variable Identifier

hi! link TelescopeSelection Normal
hi MiniJump gui=underline term=underline cterm=underline

" LSP
hi! link @lsp.type.macro.cpp Normal  " Originally links to PreProc
hi DiagnosticUnnecessary ctermfg=19 guifg=Blue3  " Originally links to Comment

" copilot.lua.
hi! link CopilotAnnotation Comment
hi CopilotSuggestion ctermfg=239 guifg=Grey42

" treesitter-context.
hi TreesitterContext ctermfg=0 guifg=Black ctermbg=241 guibg=#626262

" mini.lua
" hi MiniClueNextKey ctermfg=15 guifg=White  " next key label in clue window

" delimited-nvim.
" hi! link DelimitedError DiagnosticVirtualTextError
" hi! link DelimitedWarn DiagnosticVirtualTextWarn
" hi! link DelimitedInfo DiagnosticVirtualTextInfo
" hi! link DelimitedHint DiagnosticVirtualTextHint

let g:colors_name = "gaels"

" vim: sw=2
