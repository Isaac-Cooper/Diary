:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                   Diary                                                 ::
:::::::::::::::::::::::::::::::: By Isaac Cooper ::::::::::::::::::::::::::::::::::::::::::::

@echo off
:startup

title LOADING...

echo LOADING Diary

echo PLEASE WAIT...

cd "C:\Program Files"

echo Temp > temp.diary
if not exist "temp.diary" goto needsadmin
del temp.diary
cls
goto skip
:needsadmin
cls
msg * Warning: Uninstaller requires to be run as administrator!
exit

:skip

if exist "Diary" goto ok
msg * Uninstaller requires Diary to be installed!
exit

:ok
cls
:home
cd "C:\Program Files"
cls
color 7

title Diary UnInstaller

cls

echo --------------

echo Diary UnInstaller

echo --------------

echo.

echo 1. Uninstall

echo --------------

echo 2. exit

echo.

set /p "a=Choice: "

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                   Diary                                                 ::
:::::::::::::::::::::::::::::::: By Isaac Cooper ::::::::::::::::::::::::::::::::::::::::::::


if ["%a%"] == ["1"] goto uninstall

if ["%a%"] == ["2"] exit

if ["%a%"] == [""] goto home
goto home

:uninstall
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"

:login

color 7


cls
echo -------------- Please login to an admin account!
set /p "user=Enter Username: "

if ["%user%"] == [""] goto LOGIN

if EXIST "%user%" goto pass

goto usernotexist

:usernotexist

color c

cls

echo USERNAME doesn't exist.

pause >nul

goto login

:pass

cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
cd "%user%"
call %user%.bat
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"

set /p "pass=Password: "

if ["%pass%"] == ["%apass%"] goto loginpasscorrect
goto passinvalid
:loginpasscorrect
if ["%admin%"] == ["yes"] goto logingood
color c

cls

echo USER is not an ADMIN!
pause >nul

goto login

:passinvalid

color c

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                   Diary                                                 ::
:::::::::::::::::::::::::::::::: By Isaac Cooper ::::::::::::::::::::::::::::::::::::::::::::

cls

echo PASSWORD is INVALID!
pause >nul

goto login

:logingood
cls 
echo Diary
echo B
echo Y
echo.
echo I

echo S


::  frrm n


echo A

echo A
cls
echo C
cls
color a
echo Uninstalling Diary...
echo.
ping localhost -n 3 >nul
cls
cd "C:\Program Files"
RMDIR /S /Q Diary
cls
echo Diary Uninstalled!
pause
exit

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                   Diary                                                 ::
:::::::::::::::::::::::::::::::: By Isaac Cooper ::::::::::::::::::::::::::::::::::::::::::::