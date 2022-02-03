#!/bin/bash
rst="$(tput sgr0)"
fgred="${rst}$(tput setaf 1)" # Red
fggrn="${rst}$(tput setaf 2)" # Green
fgylw="${rst}$(tput setaf 3)" # Yellow
bld="$(tput bold)"
bfgred="${bld}$(tput setaf 1)"
bfggrn="${bld}$(tput setaf 2)"
bfgylw="${bld}$(tput setaf 3)"

echo ''${bfgylw}'         (                       (
         )\ )        )           )\ )              (
        (()/(  (  ( /((         (()/(    (   )  (  )\
         /(_))))\ )\())(   ( ___ /(_))  ))\ /(( )\((_|
        ('${fgred}'_'${fgylw}')) /((_|'${fgred}'_'${fgylw}'))(('${bfgylw}')\  )\___('${fgred}'_'${fgylw}'))'${fgred}'_'${fgylw}'  /((_|_))((_)_ )\'${fgred}'
        | _ \'${fgylw}'('${fgred}'_'${fgylw}'))'${fgred}'| |_ '${fgylw}'(('${fgred}'_'${fgylw}')(('${fgred}'_'${fgylw}')   '${fgred}'|   \'${fgylw}'('${fgred}'_'${fgylw}')) '${fgred}'_'${fgylw}')(('${fgred}'_|_)'${fgylw}' (('${fgred}'_'${fgylw}')'${fgred}'
        |   / -_)|  _| `_/ _ \   | |) / -_)\ V /| | (_-<
        |_|_\___| \__|_| \___/   |___/\___| \_/ |_|_/__/
        
        -------------DIABLOS ARCADE V1.1.--------------- '
sleep 5
