:: variables
setlocal HOME=C:\Users\ajohnston

setlocal DOT=%JAVA%\dotfiles

setlocal JAVA=%HOME%\java
setlocal F_API=%JAVA%\foundation-api
setlocal F_WWW=%JAVA%\foundation-www
setlocal ST_API=%JAVA%\stratascape-api
setlocal ST_WWW=%JAVA%\stratascape-www
setlocal SA_API=%JAVA%\salesscape-api
setlocal SA_WWW=%JAVA%\salesscape-www
setlocal B_API=%JAVA%\bankchoice-api
setlocal B_WWW=%JAVA%\bankchoice-www

setlocal DESKTOP=%HOME%\Desktop
setlocal DIFF_DIR=%DESKTOP%\diff
setlocal F_API_DIFF=%DIFF_DIR%\found-api.diff
setlocal F_WWW_DIFF=%DIFF_DIR%\found-www.diff
setlocal ST_API_DIFF=%DIFF_DIR%\strata-api.diff
setlocal ST_WWW_DIFF=%DIFF_DIR%\strata-www.diff
setlocal SA_API_DIFF=%DIFF_DIR%\sales-api.diff
setlocal SA_WWW_DIFF=%DIFF_DIR%\sales-www.diff
setlocal B_API_DIFF=%DIFF_DIR%\bank-api.diff
setlocal B_WWW_DIFF=%DIFF_DIR%\bank-www.diff

:: cd
doskey ~ = cd %HOME%
doskey dot = cd %DOT%
doskey fapi = cd %F_API%
doskey fwww = cd %F_WWW%
doskey stapi = cd %ST_API%
doskey stwww = cd %ST_WWW%
doskey saapi = cd %SA_API%
doskey sawww = cd %SA_WWW%
doskey bapi = cd %B_API%
doskey bwww = cd %B_WWW%

:: svn up
doskey fup = svn up %F_API% ^& svn up %F_WWW%
doskey stup = svn up %ST_API% ^& svn up %ST_WWW%
doskey saup = svn up %SA_API% ^& svn up %SA_WWW%
doskey bup = svn up %B_API% ^& svn up %B_WWW%
doskey allup = svn up %F_API% ^& svn up %F_WWW% ^& svn up %ST_API% ^& svn up %ST_WWW% ^& svn up %SA_API% ^& svn up %SA_WWW% ^& svn up %B_API% ^& svn up %B_WWW%

:: svn diff
:: output "directory already exists" error to unused var NULL
doskey fdiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %F_API% $g %F_API_DIFF% ^& echo created %F_API_DIFF% ^& svn di %F_WWW% $g %F_WWW_DIFF% ^& echo created %F_WWW_DIFF%
doskey stdiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %ST_API% $g %ST_API_DIFF% ^& echo created %ST_API_DIFF% ^& svn di %ST_WWW% $g %ST_WWW_DIFF% ^& echo created %ST_WWW_DIFF%
doskey sadiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %SA_API% $g %SA_API_DIFF% ^& echo created %SA_API_DIFF% ^& svn di %SA_WWW% $g %SA_WWW_DIFF% ^& echo created %SA_WWW_DIFF%
doskey bdiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %B_API% $g %B_API_DIFF% ^& echo created %B_API_DIFF% ^& svn di %B_WWW% $g %B_WWW_DIFF% ^& echo created %B_WWW_DIFF%
doskey alldiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %F_API% $g %F_API_DIFF% ^& echo created %F_API_DIFF% ^& svn di %F_WWW% $g %F_WWW_DIFF% ^& echo created %F_WWW_DIFF% ^& svn di %ST_API% $g %ST_API_DIFF% ^& echo created %ST_API_DIFF% ^& svn di %ST_WWW% $g %ST_WWW_DIFF% ^& echo created %ST_WWW_DIFF% ^& svn di %SA_API% $g %SA_API_DIFF% ^& echo created %SA_API_DIFF% ^& svn di %SA_WWW% $g %SA_WWW_DIFF% ^& echo created %SA_WWW_DIFF% ^& svn di %B_API% $g %B_API_DIFF% ^& echo created %B_API_DIFF% ^& svn di %B_WWW% $g %B_WWW_DIFF% ^& echo created %B_WWW_DIFF%

:: run www server
doskey strun = cd %ST_WWW% ^& grunt server
doskey sarun = cd %SA_WWW% ^& grunt server
doskey brun = cd %B_WWW% ^& grunt server
