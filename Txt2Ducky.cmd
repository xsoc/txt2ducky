@echo off

rem                              UNLICENSE
rem This is free and unencumbered software released into the public domain.

rem Anyone is free to copy, modify, publish, use, compile, sell, or
rem distribute this software, either in source code form or as a compiled
rem binary, for any purpose, commercial or non-commercial, and by any
rem means.

rem In jurisdictions that recognize copyright laws, the author or authors
rem of this software dedicate any and all copyright interest in the
rem software to the public domain. We make this dedication for the benefit
rem of the public at large and to the detriment of our heirs and
rem successors. We intend this dedication to be an overt act of
rem relinquishment in perpetuity of all present and future rights to this
rem software under copyright law.

rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
rem EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
rem MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
rem IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
rem OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
rem ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
rem OTHER DEALINGS IN THE SOFTWARE.

rem For more information, please refer to unlicense.org


IF "%1" EQU "/?" GOTO help
IF "%1" EQU ""   GOTO help
IF "%2" EQU ""   GOTO help

SETLOCAL

SET FILEIN=%1
SET FILEOUT=%2

IF EXIST "%FILEIN%" (
    IF EXIST "%FILEOUT%" del "%FILEOUT%"

    @echo Processing %FILEIN%...
    FOR /F "usebackq delims=" %%I IN ("%FILEIN%") DO (
        @echo STRING %%I >> "%FILEOUT%"
        @echo ENTER      >> "%FILEOUT%"
    )
    @echo Complete.
) ELSE (
    @echo File not found: "%FILEIN%"
)

ENDLOCAL

GOTO :EOF

:help
@echo Converts a text file to Ducky Script
@echo.
@echo Usage:
@echo     Txt2Ducky InputFile OutputFile