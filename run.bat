
::				███╗   ██╗██╗  ██╗████████╗███████╗██╗   ██╗███████╗
::				████╗  ██║╚██╗██╔╝╚══██╔══╝██╔════╝╚██╗ ██╔╝██╔════╝
::				██╔██╗ ██║ ╚███╔╝    ██║   ███████╗ ╚████╔╝ ███████╗
::				██║╚██╗██║ ██╔██╗    ██║   ╚════██║  ╚██╔╝  ╚════██║
::				██║ ╚████║██╔╝ ██╗   ██║   ███████║   ██║   ███████║
::				╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝
::
:: title   : Script adb over wifi 
:: script  : batch (.bat) or (.cmd)
:: Dev     : NxtSys / @Number666
:: Test on : Windows 10 (Version 1703)
:: Desc/   : Open Sources script, free your mod's
::-----------------------------------------------------------------------------------------
::                                       Terms of use:
:: I am not responsible for any damage.
:: your own risk! I am not responsible for bricked devices, data loss, system crash,
:: and you point the finger at me for messing up your devices,
:: I will laugh at you..!!

@echo off
title ADB Wireless Debugging Over Wi-Fi - NxtSys
mode 90, 34
color 0a
:Menu
cls
echo.
echo         +---------------------------------------------------------------------+
echo         -      Android Debug Bridge (adb) Wireless Debugging Over Wi-Fi       -
echo         -                       by NxtSys - @Number666                        -
echo         +---------------------------------------------------------------------+
echo.
if exist "%homedrive%\Program Files (x86)" (
echo                                                                  auto detected : [64-bit] )
if not exist "%homedrive%\Program Files (x86)" (
echo                                                                  auto detected : [32-bit] )
::echo.
::adb version
::echo.
echo.
echo      [ Menu ]
echo.
echo      1. adb start
echo      2. show ip
echo      3. add tcpip
echo      4. cmd (adb)
echo      5. Exit Program
echo.
echo      NB:
echo         step 4, open adb terminal and type: adb connect (IP_Target):5555
echo.
SET /P M=input the menu number and press ENTER : 
if %M%==1 goto adb
if %M%==2 goto ip
if %M%==3 goto tcpip
if %M%==4 goto adbcmd
if %M%==5 goto exit

:adb
cls
echo.
echo   [ adb starting ]
echo.
:: adb starting..
adb kill-server
adb start-server
pause >nul
goto Menu

:ip
cls
echo.
echo   [ Show IP ]
echo.
:: copy IP target
adb shell ip -f inet addr show wlan0
pause >nul
goto Menu

:tcpip
cls
echo.
echo   [ add tcpip ]
echo.
:: add tcpip
echo after add tpip, remove usb cable
adb tcpip 5555
pause >nul
goto Menu

:adbcmd
cls
start C:\adb\cmd.exe
goto Menu
:: remove cable
::adb connect <IP>:5555

pause >nul

:exit
exit
