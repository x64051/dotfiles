
function n --description 'support nnn quit and change directory'
        set NNN_TMPFILE "/tmp/nnn"
        env NNN_TMPFILE="/tmp/nnn" nnn -d $argv[1]

        if test -e $NNN_TMPFILE
                . $NNN_TMPFILE
                rm $NNN_TMPFILE
        end
end

