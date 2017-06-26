function clear
    set a $status
    env clear
    fish_greeting
    return $status
end
