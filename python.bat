@echo off
:: Copyright 2017 The Chromium Authors. All rights reserved.
:: Use of this source code is governed by a BSD-style license that can be
:: found in the LICENSE file.

setlocal
set PYTHON_BAT_RUNNER=1

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: This file is automatically generated by "bootstrap\win\win_tools.py", and
:: should not be modified.
::
:: The previous "::" block acts as a nop-sled. Each time a batch file executes
:: a command, it reloads itself and seeks to its previous execution offset to
:: begin execution. Updating this batch file is, therefore, risky, since any
:: running Python instance that is using the old batch file will reload the new
:: batch file once the Python command terminates and resume at some unknown
:: offset.
::
:: With the sled in place, a previous instance will resume mid-label. We are
:: assuming that the offset of the Python invocation is greater than the
:: PYTHON_BAT_RUNNER set command, which is the case since the old instance has
:: a large PATH set block before the Python execution. Old instances will hit
:: the next block of code without PYTHON_BAT_RUNNER set. New instances will have
:: it set.
::
:: We remedy this in the future by having the batch file load its core paths
:: from an external file with for/set, removing the need to modify "python.bat"
:: during upgrade.
::
:: After all of the old batch files are believed to be replaced, we can remove
:: the PYTHON_BAT_RUNNER block and the sled. For this update, old instances
:: will resume past the end of the file and terminate.

if not "%PYTHON_BAT_RUNNER%" == "1" goto :END

for /f %%i in (%~dp0python_bin_reldir.txt) do set PYTHON_BIN_RELDIR=%%i
set PATH=%~dp0%PYTHON_BIN_RELDIR%;%~dp0%PYTHON_BIN_RELDIR%\Scripts;%PATH%
"%~dp0%PYTHON_BIN_RELDIR%\python.exe" %*

:END
