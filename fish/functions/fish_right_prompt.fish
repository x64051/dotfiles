function fish_right_prompt
    set -l last_status $status
    if [ $last_status -ne 0 ]
        echo -e -n "[31;40m[30;41m$last_status"(set_color normal)
    end
end
