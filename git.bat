@echo off
setlocal
if not defined EDITOR set EDITOR=notepad
set PATH=%~dp0win_tools-2_7_6_bin\git\cmd;%~dp0;%PATH%
"%~dp0win_tools-2_7_6_bin\git\cmd\git.exe" %*
