# load the bash_aliases file

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# add below to the cygwin .bashrc

export TERM=xterm-256color

WORKSPACE='/c/Users/ajohnston/java'
STAPI='/stratascape-api'
SAAPI='/salesscape-api'
BAPI='/bankchoice-api'
STWWW='/stratascape-www'
SAWWW='/salesscape-www'
BWWW='/bankchoice-www'

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
        *)
            cd ${WORKSPACE}
    esac
}

DESKTOP='/c/Users/ajohnston/Desktop'
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

# grunt server
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

# grunt server
function gs ()
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

# copy to desktop
function cpdesk ()
{
    cp $1 ${DESKTOP}
}
