function fish_right_prompt
    set -l last_status $status
    if [ $last_status -ne 0 ]
        echo -e -n "[100;31m[7m$last_status"(set_color normal)
    end
end
