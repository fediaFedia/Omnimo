@echo off

call:timer

:timer
ping -n 10 127.0.0.1 > NUL
goto byebye

:byebye
IF %ERRORLEVEL% LSS 1 (goto okay) ELSE (goto bad)

:okay
notepad
exit

:bad
mspaint
exit