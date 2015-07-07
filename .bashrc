# load aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## Cygwin

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

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

# convenience methods

WORKSPACE='/c/Users/ajohnston/java'
STAPI='/stratascape-api'
SAAPI='/salesscape-api'
BAPI='/bankchoice-api'
STWWW='/stratascape-www'
SAWWW='/salesscape-www'
BWWW='/bankchoice-www'
DOT='/dotfiles'
MISC='/misc'

function go ()
{
    case "$1" in
        stapi)
            cd ${WORKSPACE}${STAPI}
            ;;
        saapi)
            cd ${WORKSPACE}${SAAPI}
            ;;
        bapi)
            cd ${WORKSPACE}${BAPI}
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
    svn up ${WORKSPACE}${STAPI}
    svn up ${WORKSPACE}${SAAPI}
    svn up ${WORKSPACE}${BAPI}
    svn up ${WORKSPACE}${STWWW}
    svn up ${WORKSPACE}${SAWWW}
    svn up ${WORKSPACE}${BWWW}
}

function alldiff ()
{
    rm -rf ${DIFFDIR}
    mkdir ${DIFFDIR}
    svn diff ${WORKSPACE}${STAPI} > ${DIFFDIR}${STAPI}.diff
    svn diff ${WORKSPACE}${SAAPI} > ${DIFFDIR}${SAAPI}.diff
    svn diff ${WORKSPACE}${BAPI} > ${DIFFDIR}${BAPI}.diff
    svn diff ${WORKSPACE}${STWWW} > ${DIFFDIR}${STWWW}.diff
    svn diff ${WORKSPACE}${SAWWW} > ${DIFFDIR}${SAWWW}.diff
    svn diff ${WORKSPACE}${BWWW} > ${DIFFDIR}${BWWW}.diff
}

# vim open diff
function vod ()
{
    case "$1" in
        stapi)
            vim ${DIFFDIR}${STAPI}.diff
            ;;
        saapi)
            vim ${DIFFDIR}${SAAPI}.diff
            ;;
        bapi)
            vim ${DIFFDIR}${BAPI}.diff
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
