function fish_right_prompt
    set _g (git rev-parse --abbrev-ref HEAD ^ /dev/null)
    if [ $status = 0 ]
        echo -n -e "[0;32;100m[7m$_g"(set_color normal)
    end
end
