@echo off
setlocal

:: Set the source file path
set "source1=.clang-format"
set "source2=.clang-tidy"

:: Prompt for username
set /p "username=Enter your username (default: emp8120177): "

:: Use default username if input is empty
if "%username%"=="" set "username=emp8120177"

:: Set the destination file path using the provided or default username
set "destination1=C:\Users\%username%\.clang-format"
set "destination2=C:\Users\%username%\.clang-tidy"

:: Copy the file and replace if it exists
copy /Y "%source1%" "%destination1%"
copy /Y "%source2%" "%destination2%"

:: Check if the copy was successful
if %errorlevel% equ 0 (
    echo File copied successfully.
) else (
    echo Error occurred while copying the file.
)

endlocal
