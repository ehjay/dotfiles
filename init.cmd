:: variables
set ROOT=C:\Users\ajohnston\Documents\dev

set DOT=%ROOT%\dotfiles
set MISC=%ROOT%\misc
set BIG=%ROOT%\bigdata
set F_API=%ROOT%\foundation-api
set F_WWW=%ROOT%\foundation-www
set ST_API=%ROOT%\stratascape-api
set ST_WWW=%ROOT%\stratascape-www
set SA_API=%ROOT%\salesscape-api
set SA_WWW=%ROOT%\salesscape-www
set B_API=%ROOT%\bankchoice-api
set B_WWW=%ROOT%\bankchoice-www
set P_API=%ROOT%\ptekintegration-api
set P_WWW=%ROOT%\ptekintegration-www

set DESKTOP=%HOME%\Desktop
set DIFF_DIR=%DESKTOP%\diff
set BIG_DIFF=%DIFF_DIR%\bigdata.diff
set F_API_DIFF=%DIFF_DIR%\found-api.diff
set F_WWW_DIFF=%DIFF_DIR%\found-www.diff
set ST_API_DIFF=%DIFF_DIR%\strata-api.diff
set ST_WWW_DIFF=%DIFF_DIR%\strata-www.diff
set SA_API_DIFF=%DIFF_DIR%\sales-api.diff
set SA_WWW_DIFF=%DIFF_DIR%\sales-www.diff
set B_API_DIFF=%DIFF_DIR%\bank-api.diff
set B_WWW_DIFF=%DIFF_DIR%\bank-www.diff
set P_API_DIFF=%DIFF_DIR%\ptek-api.diff
set P_WWW_DIFF=%DIFF_DIR%\ptek-www.diff

:: cd
doskey ~ = cd %HOME%
doskey dot = cd %DOT%
doskey misc = cd %MISC%
doskey big = cd %BIG%
doskey fapi = cd %F_API%
doskey fwww = cd %F_WWW%
doskey stapi = cd %ST_API%
doskey stwww = cd %ST_WWW%
doskey saapi = cd %SA_API%
doskey sawww = cd %SA_WWW%
doskey bapi = cd %B_API%
doskey bwww = cd %B_WWW%
doskey papi = cd %P_API%
doskey pwww = cd %P_WWW%

:: svn update
doskey allup = svn up %BIG% ^& svn up %F_API% ^& svn up %F_WWW% ^& svn up %ST_API% ^& svn up %ST_WWW% ^& svn up %SA_API% ^& svn up %SA_WWW% ^& svn up %B_API% ^& svn up %B_WWW% ^& svn up %P_API% ^& svn up %P_WWW%

:: svn diff
:: output "directory already exists" error to unused var NULL
doskey alldiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %BIG% $g %BIG_DIFF% ^& echo created %BIG_DIFF% ^& svn di %F_API% $g %F_API_DIFF% ^& echo created %F_API_DIFF% ^& svn di %F_WWW% $g %F_WWW_DIFF% ^& echo created %F_WWW_DIFF% ^& svn di %ST_API% $g %ST_API_DIFF% ^& echo created %ST_API_DIFF% ^& svn di %ST_WWW% $g %ST_WWW_DIFF% ^& echo created %ST_WWW_DIFF% ^& svn di %SA_API% $g %SA_API_DIFF% ^& echo created %SA_API_DIFF% ^& svn di %SA_WWW% $g %SA_WWW_DIFF% ^& echo created %SA_WWW_DIFF% ^& svn di %B_API% $g %B_API_DIFF% ^& echo created %B_API_DIFF% ^& svn di %B_WWW% $g %B_WWW_DIFF% ^& echo created %B_WWW_DIFF% ^& mkdir %DIFF_DIR% 2$g NULL ^& svn di %P_API% $g %P_API_DIFF% ^& echo created %P_API_DIFF% ^& svn di %P_WWW% $g %P_WWW_DIFF% ^& echo created %P_WWW_DIFF%

:: run www server
doskey strun = cd %ST_WWW% ^& grunt server
doskey sarun = cd %SA_WWW% ^& grunt server
doskey brun = cd %B_WWW% ^& grunt server
doskey prun = cd %P_WWW% ^& grunt server
