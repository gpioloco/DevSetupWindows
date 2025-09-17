@echo off
setlocal

:: Set the source file path
set "source=config.yaml"

:: Prompt for username
set /p "username=Enter your username (default: emp8120177): "

:: Use default username if input is empty
if "%username%"=="" set "username=emp8120177"

:: Set the destination file path using the provided or default username
set "destination=C:\Users\%username%\.glzr\glazewm\config.yaml"

:: Copy the file and replace if it exists
copy /Y "%source%" "%destination%"

:: Check if the copy was successful
if %errorlevel% equ 0 (
    echo File copied successfully.
) else (
    echo Error occurred while copying the file.
)

endlocal
