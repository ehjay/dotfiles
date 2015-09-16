:: variables
set HOME=C:\Users\ajohnston

set JAVA=%HOME%\java
set DOT=%JAVA%\dotfiles
set F_API=%JAVA%\foundation-api
set F_WWW=%JAVA%\foundation-www
set ST_API=%JAVA%\stratascape-api
set ST_WWW=%JAVA%\stratascape-www
set SA_API=%JAVA%\salesscape-api
set SA_WWW=%JAVA%\salesscape-www
set B_API=%JAVA%\bankchoice-api
set B_WWW=%JAVA%\bankchoice-www
set P_API=%JAVA%\ptekintegration-api
set P_WWW=%JAVA%\ptekintegration-www
set BIG=%JAVA%\bigdata

set DESKTOP=%HOME%\Desktop
set DIFF_DIR=%DESKTOP%\diff
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
set BIG_DIFF=%DIFF_DIR%\bigdata.diff

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
doskey papi = cd %P_API%
doskey pwww = cd %P_WWW%
doskey big = cd %BIG%

:: search subdirectories
doskey s = findstr /s /i /c:"$*" *.*

:: svn status
doskey fstat = echo. ^& echo foundation-api status:^& echo. ^& svn st %F_API% ^& echo. ^& echo foundation-www status:^& echo. ^& svn st %F_WWW%
doskey ststat = echo. ^& echo stratascape-api status:^& echo. ^& svn st %ST_API% ^& echo. ^& echo stratascape-www status:^& echo. ^& svn st %ST_WWW%
doskey sastat = echo. ^& echo salesscape-api status:^& echo. ^& svn st %SA_API% ^& echo. ^& echo salesscape-www status:^& echo. ^& svn st %SA_WWW%
doskey bstat = echo. ^& echo bankchoice-api status:^& echo. ^& svn st %B_API% ^& echo. ^& echo bankchoice-www status:^& echo. ^& svn st %B_WWW%
doskey pstat = echo. ^& echo ptekintegration-api status:^& echo. ^& svn st %P_API% ^& echo. ^& echo ptekintegration-www status:^& echo. ^& svn st %P_WWW%
doskey allstat = echo. ^& echo foundation-api status:^& echo. ^& svn st %F_API% ^& echo. ^& echo foundation-www status:^& echo. ^& svn st %F_WWW% ^& echo. ^& echo stratascape-api status:^& echo. ^& svn st %ST_API% ^& echo. ^& echo stratascape-www status:^& echo. ^& svn st %ST_WWW% ^& echo. ^& echo salesscape-api status:^& echo. ^& svn st %SA_API% ^& echo. ^& echo salesscape-www status:^& echo. ^& svn st %SA_WWW% ^& echo. ^& echo bankchoice-api status:^& echo. ^& svn st %B_API% ^& echo. ^& echo bankchoice-www status:^& echo. ^& svn st %B_WWW%^& echo ptekintegration-api status:^& echo. ^& svn st %P_API% ^& echo. ^& echo ptekintegration-www status:^& echo. ^& svn st %P_WWW%

:: svn update
doskey fup = svn up %F_API% ^& svn up %F_WWW%
doskey stup = svn up %ST_API% ^& svn up %ST_WWW%
doskey saup = svn up %SA_API% ^& svn up %SA_WWW%
doskey bup = svn up %B_API% ^& svn up %B_WWW%
doskey pup = svn up %P_API% ^& svn up %P_WWW%
doskey bigup = svn up %BIG%
doskey allup = svn up %F_API% ^& svn up %F_WWW% ^& svn up %ST_API% ^& svn up %ST_WWW% ^& svn up %SA_API% ^& svn up %SA_WWW% ^& svn up %B_API% ^& svn up %B_WWW% ^& svn up %P_API% ^& svn up %P_WWW% ^& svn up %BIG%

:: svn diff
:: output "directory already exists" error to unused var NULL
doskey fdiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %F_API% $g %F_API_DIFF% ^& echo created %F_API_DIFF% ^& svn di %F_WWW% $g %F_WWW_DIFF% ^& echo created %F_WWW_DIFF%
doskey stdiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %ST_API% $g %ST_API_DIFF% ^& echo created %ST_API_DIFF% ^& svn di %ST_WWW% $g %ST_WWW_DIFF% ^& echo created %ST_WWW_DIFF%
doskey sadiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %SA_API% $g %SA_API_DIFF% ^& echo created %SA_API_DIFF% ^& svn di %SA_WWW% $g %SA_WWW_DIFF% ^& echo created %SA_WWW_DIFF%
doskey bdiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %B_API% $g %B_API_DIFF% ^& echo created %B_API_DIFF% ^& svn di %B_WWW% $g %B_WWW_DIFF% ^& echo created %B_WWW_DIFF%
doskey pdiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %P_API% $g %P_API_DIFF% ^& echo created %P_API_DIFF% ^& svn di %P_WWW% $g %P_WWW_DIFF% ^& echo created %P_WWW_DIFF%
doskey alldiff = mkdir %DIFF_DIR% 2$g NULL ^& svn di %F_API% $g %F_API_DIFF% ^& echo created %F_API_DIFF% ^& svn di %F_WWW% $g %F_WWW_DIFF% ^& echo created %F_WWW_DIFF% ^& svn di %ST_API% $g %ST_API_DIFF% ^& echo created %ST_API_DIFF% ^& svn di %ST_WWW% $g %ST_WWW_DIFF% ^& echo created %ST_WWW_DIFF% ^& svn di %SA_API% $g %SA_API_DIFF% ^& echo created %SA_API_DIFF% ^& svn di %SA_WWW% $g %SA_WWW_DIFF% ^& echo created %SA_WWW_DIFF% ^& svn di %B_API% $g %B_API_DIFF% ^& echo created %B_API_DIFF% ^& svn di %B_WWW% $g %B_WWW_DIFF% ^& echo created %B_WWW_DIFF% ^& mkdir %DIFF_DIR% 2$g NULL ^& svn di %P_API% $g %P_API_DIFF% ^& echo created %P_API_DIFF% ^& svn di %P_WWW% $g %P_WWW_DIFF% ^& echo created %P_WWW_DIFF% ^& svn di %BIG% $g %BIG_DIFF% ^& echo created %BIG_DIFF%


:: run www server
doskey strun = cd %ST_WWW% ^& grunt server
doskey sarun = cd %SA_WWW% ^& grunt server
doskey brun = cd %B_WWW% ^& grunt server
doskey prun = cd %P_WWW% ^& grunt server
