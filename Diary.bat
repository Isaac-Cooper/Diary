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
if exist "Diary" goto skip
echo.
md "Diary"
cd "Diary"
md "System Files"
cd "System Files"
md "Deleted"
md "Diarys"
cd "Diarys"
:createadmin
cls
echo --------------- Create an admin account! 
echo --------------- Username and Password must contain no spaces!
echo.
set /p "nuser=Create A Username: "
if %nuser%=="" goto createadmin

if ["%nuser%"] == [""] goto createadmin

set /p "npass=Create A Password: "

if %npass%=="" goto createadmin

set /p "npassr=Repeat Password: "

if ["%npassr%"] == ["%npass%"] goto createadminsignupc

goto createadmin

:createadminsignupc

md "%nuser%"
cd "%nuser%"

echo set "auser=%nuser%"> %nuser%.bat

echo set "apass=%npass%">> %nuser%.bat

echo set "banned=no">> %nuser%.bat

echo set "admin=yes">> %nuser%.bat
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
echo %nuser% >> users.list
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
set dir="c:\Program Files\Diary\System Files\Diarys\"
FOR /D /R %dir% %%X IN (["* *"]) DO RMDIR /S /Q "%%X"
cls

color a

echo Signup successful!
pause
goto startup

:needsadmin
cls
msg * Warning: Diary requires to be run as administrator!
exit

:skip
:home
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
cls
color 7

title HOME

cls

echo --------------

echo HOME

echo --------------

echo.

echo 1. SIGNUP

echo --------------

echo 2. LOGIN

echo --------------

echo 3. DELETE ACCOUNT

echo --------------

echo 4. EXIT

echo --------------

echo.

set /p "a=Choice: "

if ["%a%"] == ["1"] goto signup

if ["%a%"] == ["2"] goto login

if ["%a%"] == ["4"] goto exit

if ["%a%"] == ["3"] goto delaccount

if ["%a%"] == [""] goto home
goto home

:signup

color 7

title SIGNUP

cls
echo --------------- Username and Password must contain no spaces!
echo.
set /p "nuser=Create A Username: "

if %nuser%=="" goto signuperror

if ["%nuser%"] == [""] goto signuperror

if EXIST "%nuser%" goto usertaken

goto npass

:usertaken

cls

color c

echo USERNAME taken, please try another one.

pause >nul

goto signup

:npass

set /p "npass=Create A Password: "

if ["%npass%"] == [""] goto signuperror

set /p "npassr=Repeat Password: "

if ["%npassr%"] == ["%npass%"] goto signupc

goto signuperror

:signupc

md "%nuser%"
cd "%nuser%"

echo set "auser=%nuser%"> %nuser%.bat

echo set "apass=%npass%">> %nuser%.bat

echo set "banned=no">> %nuser%.bat

echo set "admin=no">> %nuser%.bat

cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
echo %nuser% >> users.list
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
set dir="c:\Program Files\Diary\System Files\Diarys\"
FOR /D /R %dir% %%X IN (["* *"]) DO RMDIR /S /Q "%%X"
cls

color a

echo Signup successful!

echo Redirecting to home!

ping localhost -n 3 >nul

goto home

:login

color 7

title LOGIN

cls

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
if ["%banned%"] == ["yes"] goto loginbanned
if ["%admin%"] == ["yes"] goto logingoodadmin
goto logingood

goto passinvalid

:passinvalid

color c

cls

echo The PASSWORD you entered is INVALID

pause >nul

goto login

:loginbanned
color c
cls
echo -------------------- Banned --------------------
echo.
echo Your account has been suspended:
echo.
echo Reason: %banreason%
echo.
echo Banned On: %bannedon%
echo.
echo -------------------- Banned --------------------
pause >nul
goto home

:logingoodadmin

color a

cls

echo You have Successfully logged in [ADMIN] - %user%!

echo Redirecting to your account!

ping localhost -n 3 >nul

goto loggedinadmin

:logingood

color a

cls

echo You have Successfully logged in [USER] - %user%!

echo Redirecting to your account!

ping localhost -n 3 >nul

goto loggedinuser

:delaccount

color 7

title DELETE ACCOUNT

cls

set /p "duser=Username: "

if ["%duser%"] == [""] goto delaccount

if exist "%duser%" goto contin

goto usernotexistdel

:contin
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
cd "%duser%"
call %duser%.bat
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"

set /p "dpass=Password: "

if ["%dpass%"] == ["%apass%"] goto contin2

goto passerror

:contin2

cls

echo Are you sure you want to delete your account?

set /p "delacc=y/n: "
if ["%banned%"] == ["yes"] goto loginbanned
if ["%delacc%"] == ["n"] goto home
if ["%delacc%"] == ["y"] goto delaccconfirmed
goto contin2
:delaccconfirmed
echo Deleting your account...


ping localhost -n 2 >nul
MOVE /-Y "* *" "C:\Program Files\Diary\System Files\Deleted"
cls

color a

echo Account deleted.

echo Redirecting to home

ping localhost -n 3 >nul

goto home

:exit

title EXIT

cls

echo Are you sure you want to exit?

set /p exit="y/n: "

if ["%exit%"] == ["y"] exit

if ["%exit%"] == ["n"] goto home

if ["%exit%"] == [""] goto exit
goto exit

:signuperror

color c

cls

echo ERROR

echo proceeding back to SIGNUP...

ping localhost -n 2 >nul

goto signup

:passerror

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                   Diary                                                 ::
:::::::::::::::::::::::::::::::: By Isaac Cooper ::::::::::::::::::::::::::::::::::::::::::::


color c

cls

echo PASSWORD INVALID

pause >nul

goto delaccount

:usernotexistdel

color c

cls

echo USERNAME doesn't exist.

pause >nul

goto delaccount




:loggedinadmin
color 7

cls

echo --------------

echo ADMIN PANEL

echo --------------

echo.

echo 1. USERS

echo --------------

echo 2. CONTROL ACCOUNT

echo --------------

echo 3. DELETE DELETED

echo --------------
echo 4. LOGOUT

set /p "a=Choice: "

if ["%a%"] == ["1"] goto adminusers

if ["%a%"] == ["2"] goto adminaccountcontrol

if ["%a%"] == ["3"] goto destroydeleted

if ["%a%"] == ["4"] goto home

if ["%a%"] == [""] goto loggedinadmin

goto loggedinadmin

:adminusers
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
cls

echo User List:

echo.

for /f "delims=" %%a in (users.list) DO ( 
  echo %%a
)
pause
goto loggedinadmin

:adminaccountcontrol
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
cls
echo Please chose a user to view:
for /f "delims=" %%a in (users.list) DO ( 
  echo %%a
)
echo.
set /p cuser="User: "
if ["%cuser%"] == [""] goto adminaccountcontrol

if EXIST "%cuser%" goto acpass

color c

cls

echo USER has eather deleted there account or doesn't exist!
pause
color 7
goto adminaccountcontrol

:acpass

cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
cd "%cuser%"
call %cuser%.bat
cls
echo User:
echo %cuser%
echo.
echo Banned:
echo %banned%
echo.
if ["%banned%"]==["no"] goto acisbannedskip
echo Ban Reason:
echo %banreason%
echo.
:acisbannedskip
echo Admin:
echo %admin%
echo.
echo Options:
echo.
echo 1. Ban

echo --------------

echo 2. Give Admin

echo --------------

echo 3. Change Pass

echo --------------

echo 4. View Diary

echo --------------

echo 5. Delete Diary

echo --------------

echo 6. Go Back

echo.
set /p a="Choice: "
if ["%a%"] == ["1"] goto adminban
if ["%a%"] == ["2"] goto adminpromote
if ["%a%"] == ["3"] goto acchanpass
if ["%a%"] == ["4"] goto acviewdiary
if ["%a%"] == ["5"] goto acdeldiary
if ["%a%"] == ["6"] goto loggedinadmin
goto acpass

:acdeldiary
cls
echo Delete %auser%'s Diary?
echo.
set /p deldiary="y/n? "
if ["%deldiary%"] == ["y"] goto deldiary

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                   Diary                                                 ::
:::::::::::::::::::::::::::::::: By Isaac Cooper ::::::::::::::::::::::::::::::::::::::::::::

goto acpass
:deldiary
del diary.data
cls
color a
echo %auser%'s Diary has been deleted!
echo.
pause
color 7
goto acpass

:acchanpass
cls
echo Please enter %auser%'s new password:
echo.
set /p acnewpass="New Password: "
cls
echo set "auser=%auser%"> %auser%.bat

echo set "apass=%acnewpass%">> %auser%.bat

echo set "banned=%banned%">> %auser%.bat
if ["%banned%"] == ["no"] goto acchanpassskipban
echo set "bannedon=%bannedon%">>%auser%.bat

echo set "banreason=%banreason%">>%auser%.bat
:acchanpassskipban
echo set "admin=%admin%">> %auser%.bat
cls
color a
echo %auser%'s Password Changed!
echo.
pause
color 7
goto acpass
cls

:adminban
cls
set /p a="Ban/Unban? [1/2] "
if ["%a%"] == ["1"] goto admincban
if ["%a%"] == ["2"] goto admincunban
if ["%a%"] == [""] goto adminban
goto adminban
:admincban
cls
echo Please enter a reason!
echo.
set /p reason="Ban Reason: "
echo set "auser=%auser%"> %auser%.bat

echo set "apass=%apass%">> %auser%.bat

echo set "banned=yes">> %auser%.bat

echo set "bannedon=%time% - %date%">>%auser%.bat

echo set "banreason=%reason%">>%auser%.bat

echo set "admin=%admin%">> %auser%.bat
cls
color a
echo %auser% Banned!
echo.
pause
color 7
goto acpass
:admincunban
echo set "auser=%auser%"> %auser%.bat

echo set "apass=%apass%">> %auser%.bat

echo set "banned=no">> %auser%.bat

echo set "admin=%admin%">> %auser%.bat
cls
color a
echo %auser% UnBanned!
echo.
pause
color 7
goto acpass
:adminpromote
cls
set /p a="Promote/Demote? [1/2] "
if ["%a%"] == ["1"] goto admincpromote
if ["%a%"] == ["2"] goto admincdemote
if ["%a%"] == [""] goto adminpromote
goto promote
:admincpromote
echo set "auser=%auser%"> %auser%.bat

echo set "apass=%apass%">> %auser%.bat

echo set "banned=%banned%">> %auser%.bat
if ["%banned%"] == ["no"] goto accpromotekipban
echo set "bannedon=%bannedon%">>%auser%.bat

echo set "banreason=%banreason%">>%auser%.bat
:accpromotekipban

echo set "admin=yes">> %auser%.bat
cls
color a
echo %auser% Promoted to ADMIN!
echo.
pause
color 7
goto acpass
:admincdemote
echo set "auser=%auser%"> %auser%.bat

echo set "apass=%apass%">> %auser%.bat

echo set "banned=%banned%">> %auser%.bat
if ["%banned%"] == ["no"] goto accdeomotekipban

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                   Diary                                                 ::
:::::::::::::::::::::::::::::::: By Isaac Cooper ::::::::::::::::::::::::::::::::::::::::::::

echo set "bannedon=%bannedon%">>%auser%.bat

echo set "banreason=%banreason%">>%auser%.bat
:accdeomotekipban

echo set "admin=no">> %auser%.bat
cls
color a
echo %auser% Demoted to USER!
echo.
pause
color 7
goto acpass


:destroydeleted
cd "C:\Program Files"
cd "Diary"
cd "System Files"
RMDIR /S /Q Deleted
md Deleted

cls
color a
echo Deleted all deleted accounts!
pause
color 7
goto loggedinadmin

:acviewdiary
cls
if not exist diary.data goto acnodiary
for /f "delims=" %%a in (diary.data) DO ( 
  echo %%a
)
pause
goto acpass
:acnodiary
color c
cls
echo Sorry! it looks like %auser%'s diary is empty,
pause
color 7
goto acpass

:loggedinuser
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
cd "%auser%"
call %auser%.bat
if ["banned"] == ["yes"] goto loginbanned
color 7

cls

echo --------------

echo OPTIONS

echo --------------

echo.

echo 1. VIEW DIARY

echo --------------

echo 2. WRITE DIARY

echo --------------

echo 3. LOGOUT


set /p "a=Choice: "

if ["%a%"] == ["1"] goto viewdiary

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                   Diary                                                 ::
:::::::::::::::::::::::::::::::: By Isaac Cooper ::::::::::::::::::::::::::::::::::::::::::::


if ["%a%"] == ["2"] goto writediary

if ["%a%"] == ["3"] goto home

if ["%a%"] == [""] goto loggedinuser
goto loggedinuser

:viewdiary
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
cd "%auser%"
call %auser%.bat
if ["banned"] == ["yes"] goto loginbanned
cls
if not exist diary.data goto nodiary
for /f "delims=" %%a in (diary.data) DO ( 
  echo %%a
)
pause
goto loggedinuser
:nodiary
cd "C:\Program Files"
cd "Diary"
cd "System Files"
cd "Diarys"
cd "%auser%"
call %auser%.bat
if ["banned"] == ["yes"] goto loginbanned
color c
cls
echo Sorry! it looks like your diary is empty,
pause
color 7
goto loggedinuser

:writediary
cls
echo Type //back to go back!
echo -------------------------------------------------------- >> diary.data
echo Written By %user%, %time% - %date% >> diary.data
:newline
set /p text=
if ["%text%"]==["//back"] goto loggedinuser
echo %text% >> diary.data
goto newline

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                   Diary                                                 ::
:::::::::::::::::::::::::::::::: By Isaac Cooper ::::::::::::::::::::::::::::::::::::::::::::
