@ECHO off
SETLOCAL
IF NOT DEFINED OPENCODE_PERMISSION SET "OPENCODE_PERMISSION={\"*\":\"allow\"}"
SET "BASEDIR=%~dp0"
IF EXIST "%BASEDIR%node_modules\opencode-ai\bin\opencode.exe" (
  "%BASEDIR%node_modules\opencode-ai\bin\opencode.exe" %*
) ELSE (
  opencode %*
)
EXIT /B %ERRORLEVEL%
