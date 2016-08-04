:: Uninstall Windows Updates (Telemetry, Win10, issues, etc.)
:: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
echo RemoveUpdates removes updates related to Windows 10 and Telemetry.
echo Updates that cause issues or annoyances on Windows 7 or 8.1 are also removed.
echo.
echo View the contents of this file before use.
echo It is essential to understand what each update contains.
TIMEOUT 15
echo.
 ) else (
echo Error: RemoveUpdates must be run as an Administrator.
goto End
)


echo Uninstalling KB:971033 (if it exists)...
:: This update checks whether or not your copy of Windows is activated. Not recommended for privacy reasons.
wusa /uninstall /KB:971033 /quiet /norestart 


echo Uninstalling KB:2505438 (if it exists)...
:: This update may cause issues with DirectWrite on Windows 7. Not recommended.
wusa /uninstall /KB:2505438 /quiet /norestart 


echo Uninstalling KB:2506928 (if it exists)...
:: This update supposedly contains telemetry, and fixes an html link in Outlook on Windows 7. Not recommended, as one is better safe than sorry.
wusa /uninstall /KB:2506928 /quiet /norestart 


echo Uninstalling KB:2545698 (if it exists)...
:: This update may blur fonts in Internet Explorer on systems running Windows 7. Not recommended.
wusa /uninstall /KB:2545698 /quiet /norestart 


echo Uninstalling KB:2660075 (if it exists)...
:: This update forbids you to change the time and date if the time zone is set to Samoa (UTC+13:00) and KB 2657025 is installed in Windows 7. Not recommended.
wusa /uninstall /KB:2660075 /quiet /norestart 


echo Uninstalling KB:2670838 (if it exists)...
:: This update breaks aero functionality and gives blurry fonts on some websites on systems running Windows 7. Not recommended.
wusa /uninstall /KB:2670838 /quiet /norestart 


echo Uninstalling KB:2726535 (if it exists)...
:: This update adds South Sudan to the list of timezones. Not recommended.
wusa /uninstall /KB:2726535 /quiet /norestart 


echo Uninstalling KB:2876229 (if it exists)...
:: This update installs Skype and makes MSN your home page with Bing as your search engine. Not reccomended.
wusa /uninstall /KB:2876229 /quiet /norestart 


echo Uninstalling KB:2882822 (if it exists)...
:: This update contains ITraceRelogger (Telemetry) for Windows 7. Not recommended.
wusa /uninstall /KB:2882822 /quiet /norestart 


echo Uninstalling KB:2902907 (if it exists)...
:: This update has no description avaliable. Not reccomended due to a lack of documentation.
wusa /uninstall /KB:2902907 /quiet /norestart 


echo Uninstalling KB:2922324 (if it exists)...
:: This update was cancelled by Microsoft, and should be removed. Not recommended.
wusa /uninstall /KB:2922324 /quiet /norestart 


echo Uninstalling KB:2923545 (if it exists)...
:: This update contains a non security-related patch for the Remote Desktop Protocol on systems running Windows 7, and may cause issues. Not recommended.
wusa /uninstall /KB:2923545 /quiet /norestart 


echo Uninstalling KB:2952664 (if it exists)...
:: This update contains a compatibility update for upgrading Windows 7. Not recommended.
wusa /uninstall /KB:2952664 /quiet /norestart 


echo Uninstalling KB:2970228 (if it exists)...
:: This update causes issues on Windows 7.
wusa /uninstall /KB:2970228 /quiet /norestart 


echo Uninstalling KB:2976978 (if it exists)...
:: This update contains an updated symbol for the ruble, but mostly causes "Blue Screen of Death" issues. Not recommended.
wusa /uninstall /KB:2976978 /quiet /norestart 


echo Uninstalling KB:2976987 (if it exists)...
:: This update has no description avaliable. Not recommended due to a lack of documentation.
wusa /uninstall /KB:2976987 /quiet /norestart 


echo Uninstalling KB:2977759 (if it exists)...
:: This update performs diagnostics on systems running Windows 7 that participate in the Windows Customer Experience Improvement Program. Not recommended.
wusa /uninstall /KB:2977759 /quiet /norestart 


echo Uninstalling KB:2982791 (if it exists)...
:: This updates contains security fixes, but mostly causes "Blue Screen of Death" issues. Not recommended.
wusa /uninstall /KB:2982791 /quiet /norestart 


echo Uninstalling KB:2990214 (if it exists)...
:: This update enables you to upgrade from Windows 7 to a later version of Windows. Not recommended.
wusa /uninstall /KB:2990214 /quiet /norestart 


echo Uninstalling KB:3004394 (if it exists)...
:: This update has been pulled by Micrsoft. Not reccomended.
wusa /uninstall /KB:3004394 /quiet /norestart 


echo Uninstalling KB:3008273 (if it exists)...
:: This update enables an automatic update from Windows 8 to Windows 8.1. Not recommended. 
wusa /uninstall /KB:3008273 /quiet /norestart 


echo Uninstalling KB:3012973 (if it exists)...
:: This update forces the installation of the "Windows 10 Free Upgrade" tool.
wusa /uninstall /KB:3012973 /quiet /norestart 


echo Uninstalling KB:3013816 (if it exists)...
:: This update enables an MDM management service to detect and require automatic updates for systems running Windows 8.1. Not recommended.
wusa /uninstall /KB:3013816 /quiet /norestart 


echo Uninstalling KB:3014460 (if it exists)...
:: This update contains a Windows 10 Technical Preview update notification. Not recommended.
wusa /uninstall /KB:3014460 /quiet /norestart 


echo Uninstalling KB:3015249 (if it exists)...
:: This update reports UAC prompt choices when making changes to the system. Not recommended.
wusa /uninstall /KB:3015249 /quiet /norestart 


echo Uninstalling KB:3021417 (if it exists)...
:: This update has no description avaliable. Not recommended due to a lack of documentation.
wusa /uninstall /KB:3021417 /quiet /norestart 


echo Uninstalling KB:3021917 (if it exists)...
:: This update prepares systems running Windows 7 for upgrade to Windows 10.
wusa /uninstall /KB:3021917 /quiet /norestart 


echo Uninstalling KB:3022345 (if it exists)...
:: This update contains an update for customer experience and diagnostic telemetry. Not recommended.
wusa /uninstall /KB:3022345 /quiet /norestart 


echo Uninstalling KB:3035583 (if it exists)...
:: This update installs the "Get Windows 10" app in Windows 8.1 and Windows 7.
wusa /uninstall /KB:3035583 /quiet /norestart 


echo Uninstalling KB:3042058 (if it exists)...
:: This update contains winlogon spying (Telemetry). Not recommended.
wusa /uninstall /KB:3042058 /quiet /norestart 


echo Uninstalling KB:3044374 (if it exists)...
:: This update enables you to upgrade from Windows 8.1 to Windows 10. Not recommended.
wusa /uninstall /KB:3044374 /quiet /norestart 


echo Uninstalling KB:3046480 (if it exists)...
:: This update helps to determine whether or not to migrate the .NET Framework 1.1 when you upgrade Windows 8.1 or Windows 7 to Windows 10. Not recommended.
wusa /uninstall /KB:3046480 /quiet /norestart 


echo Uninstalling KB:3050265 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 7. Not recommended.
wusa /uninstall /KB:3050265 /quiet /norestart 


echo Uninstalling KB:3050267 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 8. Not recommended.
wusa /uninstall /KB:3050267 /quiet /norestart 


echo Uninstalling KB:3058168 (if it exists)...
:: This update allows activation of Windows 10 from Windows 8. Not recommended. 
wusa /uninstall /KB:3058168 /quiet /norestart 


echo Uninstalling KB:3064683 (if it exists)...
:: This update allows you to reserve a free Windows 10 upgrade during the Windows 8.1 OOBE (Out-of-Box Experience) process. Not recommended.
wusa /uninstall /KB:3064683 /quiet /norestart 


echo Uninstalling KB:3065987 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 7. Not recommended.
wusa /uninstall /KB:3065987 /quiet /norestart 


echo Uninstalling KB:3065988 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 8. Not recommended.
wusa /uninstall /KB:3065988 /quiet /norestart 


echo Uninstalling KB:3068708 (if it exists)...
:: This update contains an update for customer experience and diagnostic telemetry. Not recommended.
wusa /uninstall /KB:3068708 /quiet /norestart 


echo Uninstalling KB:3072318 (if it exists)...
:: This update allows you to reserve a free Windows 10 upgrade during the Windows 8.1 OOBE (Out-of-Box Experience) process. Not recommended.
wusa /uninstall /KB:3072318 /quiet /norestart 


echo Uninstalling KB:3074677 (if it exists)...
:: This update contains a compatibility update for upgrading to Windows 10. Not recommended.
wusa /uninstall /KB:3074677 /quiet /norestart 


echo Uninstalling KB:3075249 (if it exists)...
:: This update reports UAC prompts to Microsoft. Not recommended.
wusa /uninstall /KB:3075249 /quiet /norestart 


echo Uninstalling KB:3075851 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 7. Not recommended.
wusa /uninstall /KB:3075851 /quiet /norestart 


echo Uninstalling KB:3075853 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 8. Not recommended.
wusa /uninstall /KB:3075853 /quiet /norestart 


echo Uninstalling KB:3080149 (if it exists)...
:: This update contains an update for customer experience and diagnostic telemetry for systems running Windows 8. Not recommended.
wusa /uninstall /KB:3080149 /quiet /norestart 


echo Uninstalling KB:3081437 (if it exists)...
:: This update contains a compatibility update for upgrading to Windows 10. Not recommended.
wusa /uninstall /KB:3081437 /quiet /norestart 


echo Uninstalling KB:3081452 (if it exists)...
:: This update contains a compatibility update for upgrading to Windows 10. Not recommended.
wusa /uninstall /KB:3081452 /quiet /norestart 


echo Uninstalling KB:3081454 (if it exists)...
:: This update contains a compatibility update for upgrading to Windows 10. Not recommended.
wusa /uninstall /KB:3081454 /quiet /norestart 


echo Uninstalling KB:3081954 (if it exists)...
:: This update ensures that users are able to continue using Work Folders after they upgrade from Windows 7 to Windows 10. Not recommended.
wusa /uninstall /KB:3081954 /quiet /norestart 


echo Uninstalling KB:3083324 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 7. Not recommended.
wusa /uninstall /KB:3083324 /quiet /norestart 


echo Uninstalling KB:3083325 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 8.1. Not recommended.
wusa /uninstall /KB:3083325 /quiet /norestart 


echo Uninstalling KB:3083710 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 7. Not recommended.
wusa /uninstall /KB:3083710 /quiet /norestart 


echo Uninstalling KB:3083711 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 8. Not recommended.
wusa /uninstall /KB:3083711 /quiet /norestart 


echo Uninstalling KB:3086255 (if it exists)...
:: This update disables the service for the secdrv.sys driver (Safedisc and Securom DRMs). This affects the ability to run some older games. Not recommended.
wusa /uninstall /KB:3086255 /quiet /norestart 


echo Uninstalling KB:3088195 (if it exists)...
:: This update contains a keylogger at the kernel level. Not recommended.
wusa /uninstall /KB:3088195 /quiet /norestart 


echo Uninstalling KB:3090045 (if it exists)...
:: This update contains an update for Windows Update for systems that run Windows 8 or Windows 7 and are upgrading to Windows 10. Not recommended.
wusa /uninstall /KB:3090045 /quiet /norestart 


echo Uninstalling KB:3093983 (if it exists)...
:: This update supposedly contains some form of telemetry bundled with an update for Internet Explorer.
wusa /uninstall /KB:3093983 /quiet /norestart 


echo Uninstalling KB:3102810 (if it exists)...
:: This update was cancelled by Microsoft, and should be removed. Not recommended. 
wusa /uninstall /KB:3102810 /quiet /norestart 


echo Uninstalling KB:3102812 (if it exists)...
:: This update makes searching for updates quite slow, as well as leads to increased CPU usage when updating to Windows 10. Not recommended.
wusa /uninstall /KB:3102812 /quiet /norestart 


echo Uninstalling KB:3107998 (if it exists)...
:: This update has something to do with Lenovo USB Blocker version 1.0.0.37 and should be removed to avoid a system crash. Not recommended.	
wusa /uninstall /KB:3107998 /quiet /norestart 


echo Uninstalling KB:3112336 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 8. Not recommended.
wusa /uninstall /KB:3112336 /quiet /norestart 


echo Uninstalling KB:3112343 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 7. Not recommended.
wusa /uninstall /KB:3112343 /quiet /norestart 


echo Uninstalling KB:3123303 (if it exists)...
:: This update contains an "End of Life" upgrade notification for Internet Explorer 8, 9, and 10. Not recommended.
wusa /uninstall /KB:3123303 /quiet /norestart


echo Uninstalling KB:3123862 (if it exists)...
:: This update enables systems running Windows 7 or 8.1 start an upgrade to Windows 10. Not recommended.
wusa /uninstall /KB:3123862 /quiet /norestart


echo Uninstalling KB:3135445 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 7. Not recommended.
wusa /uninstall /KB:3135445 /quiet /norestart 


echo Uninstalling KB:3135449 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 8.1. Not recommended.
wusa /uninstall /KB:3135449 /quiet /norestart


echo Uninstalling KB:3138612 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 7. Not recommended.
wusa /uninstall /KB:3138612 /quiet /norestart 


echo Uninstalling KB:3138615 (if it exists)...
:: This update contains some improvements to the Windows Update Client in Windows 8.1. Not recommended.
wusa /uninstall /KB:3138615 /quiet /norestart  


echo Uninstalling KB:3139929 (if it exists)...
:: This update installs a "Get Windows 10" ad generator in Internet Explorer on systems running Windows 7 and Windows 8.1. Not recommended.
wusa /uninstall /KB:3139929 /quiet /norestart 


echo Uninstalling KB:3146449 (if it exists)...
:: This update contains improvements to Internet Explorer 11 in order to upgrade Windows 7 and Windows 8.1. Not recommended.
wusa /uninstall /KB:3146449 /quiet /norestart


:End
echo.
echo RemoveUpdates has finished. Please reboot the system.
TIMEOUT 20