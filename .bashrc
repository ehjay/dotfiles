# load aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias tmux="tmux -2"

## Cygwin

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# we use Ctrl + L for panes in tmux
# use Esc-C to clear console
alias cls='echo -e "\033c"'

# remove ending carriage returns
function rmr ()
{
    cat $1 | sed $'s/\r$//' > $1
}

# show process with port number
function lsport ()
{
    netstat -ano | grep :$1
}

# kill a process by port number
function killport ()
{
    PID=$(lsport $1 | sed 's/.*\s\+\([0-9]\+\)$/\1/')
    echo 'Killing PID: '${PID}
    taskkill /F /PID ${PID}
}

# list node server
function lsns ()
{
    tasklist | grep node.exe
}

# kill node server
function killns ()
{
    PID=$(lsns | sed 's/[a-z.]\+\s\+\([0-9]\+\).*/\1/')
    echo 'Killing PID: '${PID}
    taskkill /F /PID ${PID}
}

# find TypeScript files
function findts ()
{
    find . -name '*.ts' -type f -not -path '*typings*' -printf "%p\n"
}

# tsc watch
function tscwatch ()
{
    echo "Found TypeScript files: "
    findts | tee ts-files.txt
    tsc --watch -m commonjs -t es5 --emitDecoratorMetadata @ts-files.txt --rootDir ts --outDir js
}

# convenience methods

WORKSPACE='/c/Users/ajohnston/java'
FAPI='/foundation-api'
STAPI='/stratascape-api'
SAAPI='/salesscape-api'
BAPI='/bankchoice-api'
FWWW='/foundation-www'
STWWW='/stratascape-www'
SAWWW='/salesscape-www'
BWWW='/bankchoice-www'
DOT='/dotfiles'
MISC='/misc'

function go ()
{
    case "$1" in
        fapi)
            cd ${WORKSPACE}${FAPI}
            ;;
        stapi)
            cd ${WORKSPACE}${STAPI}
            ;;
        saapi)
            cd ${WORKSPACE}${SAAPI}
            ;;
        bapi)
            cd ${WORKSPACE}${BAPI}
            ;;
        fwww)
            cd ${WORKSPACE}${FWWW}
            ;;
        stwww)
            cd ${WORKSPACE}${STWWW}
            ;;
        sawww)
            cd ${WORKSPACE}${SAWWW}
            ;;
        bwww)
            cd ${WORKSPACE}${BWWW}
            ;;
        dot)
            cd ${WORKSPACE}${DOT}
            ;;
        misc)
            cd ${WORKSPACE}${MISC}
            ;;
        *)
            cd ${WORKSPACE}
    esac
}

DESKTOP='/c/Users/ajohnston/Desktop'

# copy to desktop
function cpdesk ()
{
    cp $1 ${DESKTOP}
}

DIFFDIR=${DESKTOP}'/diff'

function allup ()
{
    svn up ${WORKSPACE}${FAPI}
    svn up ${WORKSPACE}${STAPI}
    svn up ${WORKSPACE}${SAAPI}
    svn up ${WORKSPACE}${BAPI}
    svn up ${WORKSPACE}${FWWW}
    svn up ${WORKSPACE}${STWWW}
    svn up ${WORKSPACE}${SAWWW}
    svn up ${WORKSPACE}${BWWW}
}

function allst ()
{
    echo ${WORKSPACE}${FAPI}
    svn st ${WORKSPACE}${FAPI}
    echo ${WORKSPACE}${STAPI}
    svn st ${WORKSPACE}${STAPI}
    echo ${WORKSPACE}${SAAPI}
    svn st ${WORKSPACE}${SAAPI}
    echo ${WORKSPACE}${BAPI}
    svn st ${WORKSPACE}${BAPI}
    echo ${WORKSPACE}${FWWW}
    svn st ${WORKSPACE}${FWWW}
    echo ${WORKSPACE}${STWWW}
    svn st ${WORKSPACE}${STWWW}
    echo ${WORKSPACE}${SAWWW}
    svn st ${WORKSPACE}${SAWWW}
    echo ${WORKSPACE}${BWWW}
    svn st ${WORKSPACE}${BWWW}
}

function alldiff ()
{
    rm -rf ${DIFFDIR}
    mkdir ${DIFFDIR}
    svn diff ${WORKSPACE}${FAPI} > ${DIFFDIR}${FAPI}.diff
    svn diff ${WORKSPACE}${STAPI} > ${DIFFDIR}${STAPI}.diff
    svn diff ${WORKSPACE}${SAAPI} > ${DIFFDIR}${SAAPI}.diff
    svn diff ${WORKSPACE}${BAPI} > ${DIFFDIR}${BAPI}.diff
    svn diff ${WORKSPACE}${FWWW} > ${DIFFDIR}${FWWW}.diff
    svn diff ${WORKSPACE}${STWWW} > ${DIFFDIR}${STWWW}.diff
    svn diff ${WORKSPACE}${SAWWW} > ${DIFFDIR}${SAWWW}.diff
    svn diff ${WORKSPACE}${BWWW} > ${DIFFDIR}${BWWW}.diff
}

# vim open diff
function vod ()
{
    case "$1" in
        fapi)
            vim ${DIFFDIR}${FAPI}.diff
            ;;
        stapi)
            vim ${DIFFDIR}${STAPI}.diff
            ;;
        saapi)
            vim ${DIFFDIR}${SAAPI}.diff
            ;;
        bapi)
            vim ${DIFFDIR}${BAPI}.diff
            ;;
        fwww)
            vim ${DIFFDIR}${FWWW}.diff
            ;;
        stwww)
            vim ${DIFFDIR}${STWWW}.diff
            ;;
        sawww)
            vim ${DIFFDIR}${SAWWW}.diff
            ;;
        bwww)
            vim ${DIFFDIR}${BWWW}.diff
            ;;
        *)
            echo 'Please enter: stapi, saapi, bapi, stwww, sawww or bwww'
    esac
}

GRADLEECLIPSE="cmd /c gradle eclipse"

# gradle eclipse
function ge ()
{
    case "$1" in
        st)
            cd ${WORKSPACE}${STAPI}
            pwd
            ${GRADLEECLIPSE}
            ;;
        sa)
            cd ${WORKSPACE}${SAAPI}
            pwd
            ${GRADLEECLIPSE}
            ;;
        b)
            cd ${WORKSPACE}${BAPI}
            pwd
            ${GRADLEECLIPSE}
            ;;
        *)
            echo 'Please enter: st, sa, b'
    esac
}

GRUNTSERVER="cmd /c grunt server"

# node server
function ns ()
{
    case "$1" in
        st)
            cd ${WORKSPACE}${STWWW}
            pwd
            ${GRUNTSERVER}
            ;;
        sa)
            cd ${WORKSPACE}${SAWWW}
            pwd
            ${GRUNTSERVER}
            ;;
        b)
            cd ${WORKSPACE}${BWWW}
            pwd
            ${GRUNTSERVER}
            ;;
        *)
            echo 'Please enter: st, sa, b'
    esac
}

BOWERUPDATE="cmd /c bower update"

# bower update
function bu ()
{
    case "$1" in
        st)
            cd ${WORKSPACE}${STWWW}
            pwd
            ${BOWERUPDATE}
            ;;
        sa)
            cd ${WORKSPACE}${SAWWW}
            pwd
            ${BOWERUPDATE}
            ;;
        b)
            cd ${WORKSPACE}${BWWW}
            pwd
            ${BOWERUPDATE}
            ;;
        *)
            echo 'Please enter: st, sa, b'
    esac
}
