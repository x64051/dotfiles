function fish_prompt --description 'Write out the prompt'

    switch $fish_bind_mode
        case default
            echo -e -n "[30;44m"
        case insert
            echo -e -n "[30;42m"
        case visual
            echo -e -n "[30;41m"
    end
    set -l color_cwd
    echo -n -s (prompt_pwd)"[7;90m " (set_color normal)

end

