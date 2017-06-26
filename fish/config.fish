set PATH /usr/sbin/ /home/x64051/.cask/bin/ $PATH
set PATH /home/x64051/.cargo/bin/ /home/x64051/bin /usr/local/musl/bin/ $PATH


export EDITOR=nvim
export LANG=en_US.utf8
alias ag=rg # must learn to use rg

alias tigcc=/usr/local/tigcc/bin/tigcc
export TIGCC=/usr/local/tigcc/

fish_vi_key_bindings

# TODO modify colors for better support of current color scheme
set fish_color_autosuggestion FFC473
set fish_color_command green
set fish_color_comment grey
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end FF4C00
set fish_color_error FFDD73
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host normal
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param fabd2f
set fish_color_quote purple
set fish_color_redirection blue
set fish_color_search_match \x2d\x2dbackground\x3dpurple
set fish_color_selection \x2d\x2dbackground\x3dpurple
set fish_color_status red
# set fish_color_user green
# set fish_color_valid_path \x2d\x2dunderline
set fish_color_valid_path \x2d\x2dunderline
set fish_key_bindings fish_vi_key_bindings
set fish_pager_color_completion normal
set fish_pager_color_description 555\x1eyellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan
