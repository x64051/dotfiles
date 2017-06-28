function fish_prompt --description 'Write out the prompt'

    set -l last_status $status

    switch $fish_bind_mode
        case default
            set n_bg 44
        case insert
            set n_bg 42
        case visual
            set n_bg 41
    end

    if [ $last_status != 0 ]
        echo -n -s "[1;41;90m$last_status[0;$n_bg;31m"
    end

    echo -n -s "[$n_bg;30m"(prompt_pwd)"[7;90m " (set_color normal)


end

