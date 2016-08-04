:: Disable and Delete Windows Tasks and Services (Telemetry) 
:: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
 
@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
echo RemoveSchTasks removes Telemetry-related services and scheduled tasks.
echo If the GWX or GWXTriggers folders exist, they will also be removed.
echo.
echo View the contents of this file before use.
echo It is essential to understand what each task and service does.
TIMEOUT 10
echo.
 ) else (
echo Error: RemoveSchTasks must be run as an Administrator.
goto End
)

:: Kills the GWX (if running).
echo Killing the GWX (Get Windows 10 App) executable...
taskkill /F /IM "gwx.exe" >nul 2>&1

:: Takes ownership of the GWX folder, grants admin privileges for all files and subfolders contained in that folder, and then deletes it.
echo Removing the GWX folder...
takeown /a /r /d Y /f "%windir%\System32\GWX" >nul 2>&1
icacls "%windir%\System32\GWX" /grant administrators:F >nul 2>&1
rmdir /s /q "%windir%\System32\GWX" >nul 2>&1

:: Takes ownership of the GWXTriggers folder, grants admin privileges for all files and subfolders contained in that folder, and then deletes it.
echo Removing the GWXTriggers folder...
takeown /a /r /d Y /f "%windir%\System32\Tasks\Microsoft\Windows\Setup\GWXTriggers" >nul 2>&1
icacls "%windir%\System32\Tasks\Microsoft\Windows\Setup\GWXTriggers" /grant administrators:F >nul 2>&1
rmdir /s /q "%windir%\System32\Tasks\Microsoft\Windows\Setup\GWXTriggers" >nul 2>&1


:: Diagtrack is a Diagnostics Tracking Service, which sends diagnostics and data to Microsoft.
echo Stopping and deleting Diagtrack (if it exists)...
sc stop "Diagtrack" >nul 2>&1
sc config "diagtrack" start= disabled >nul 2>&1
sc delete "Diagtrack" >nul 2>&1


:: dmwappushservice is a WAP Push Message Routing Service, and is known as a keylogger.
echo Stopping and deleting dmwappushservice (if it exists)...
sc stop "dmwappushservice" >nul 2>&1
sc config "dmwappushservice" start= disabled  >nul 2>&1
sc delete "dmwappushservice" >nul 2>&1

 
:: HomeGroupListener makes local system changes (settings, tasks, etc.) according to general configs for all computers within a specific HomeGroup.
echo Stopping and deleting HomeGroupListener (if it exists)...
sc stop "HomeGroupListener" >nul 2>&1
sc config "HomeGroupListener" start= disabled >nul 2>&1
sc delete "HomeGroupListener" >nul 2>&1


:: HomeGroupProvider performs networking tasks for homegroups, specifically tasks related to configuration and maintenance. This will disable detection of homegroups on the system. 
echo Stopping and deleting HomeGroupProvider (if it exists)...
sc stop "HomeGroupProvider" >nul 2>&1
sc config "HomeGroupProvider" start= disabled >nul 2>&1 
sc delete "HomeGroupProvider" >nul 2>&1

 
:: lfsvc is the Windows Location and Framework Service, which records and monitors the current location of the system (i.e. - geolocation). 
echo Stopping and deleting lfsvc (if it exists)...
sc stop "lfsvc" >nul 2>&1
sc config "lfsvc" start= disabled >nul 2>&1
sc delete "lfsvc" >nul 2>&1


 :: Remote Registry allows remote users to modify registry settings on users’ computers. 
echo Stopping and deleting RemoteRegistry (if it exists)...
sc stop "RemoteRegistry" >nul 2>&1
sc config "RemoteRegistry" start= disabled >nul 2>&1 
sc delete "RemoteRegistry" >nul 2>&1


 :: TrkWks is the Distributed Link Tracking Client, which keeps records of links to files saved on a file server. TrkWks isn't needed on home computers. 
echo Stopping and deleting TrkWks (if it exists)...
sc stop "TrkWks" >nul 2>&1
sc config "TrkWks" start= disabled >nul 2>&1 
sc delete "TrkWks" >nul 2>&1


 :: WbioSrvc is Windows Biometric Service, and allows application to access and record user biometric data. 
echo Stopping and deleting WbioSrvc (if it exists)...
sc stop "WbioSrvc" >nul 2>&1
sc config "WbioSrvc" start= disabled >nul 2>&1
sc delete "WbioSrvc" >nul 2>&1


 :: WinDefend is Windows Defender. If an antivirus software is required, use one that does not send system data to Microsoft. 
echo Stopping and deleting WinDefend (if it exists)...
sc stop "WinDefend" >nul 2>&1
sc config "WinDefend" start= disabled >nul 2>&1
sc delete "WinDefend" >nul 2>&1

 
:: WMPNetworkSvc is Windows Media Player Network Sharing Service, which allows Windows Media Player to share user files over the internet. 
echo Stopping and deleting WMPNetworkSvc (if it exists)...
sc stop "WMPNetworkSvc" >nul 2>&1
sc config "WMPNetworkSvc" start= disabled >nul 2>&1
sc delete "WMPNetworkSvc" >nul 2>&1


:: ClickToRun Service Monitor monitors the virtualization and streaming of Microsoft Office from Microsoft's servers, which sends user data to Microsoft. 
echo Stopping and deleting ClickToRun Service Monitor (if it exists)...
schtasks /Change /TN  "Microsoft\Office\Office ClickToRun Service Monitor" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Office\Office ClickToRun Service Monitor" >nul 2>&1


:: OfficeTelemetryAgentFallBack is part of Telemetry, and stores user data and events that occur during use of Microsoft Office. 
echo Stopping and deleting OfficeTelemetryAgentFallBack (if it exists)...
schtasks /Change /TN  "Microsoft\Office\OfficeTelemetryAgentFallBack" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Office\OfficeTelemetryAgentFallBack" >nul 2>&1


 :: OfficeTelemetryAgentFallBack2016 is OfficeTelemetryAgentFallBack, updated for Microsoft Office 2016. 
echo Stopping and deleting OfficeTelemetryAgentFallBack2016 (if it exists)...
schtasks /Change /TN  "Microsoft\Office\OfficeTelemetryAgentFallBack2016" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Office\OfficeTelemetryAgentFallBack2016" >nul 2>&1

 
:: OfficeTelemetryAgentLogOn is part of Telemetry, and stores user data and events that occur during use of Microsoft Office. 
echo Stopping and deleting OfficeTelemetryAgentLogOn (if it exists)...
schtasks /Change /TN  "Microsoft\Office\OfficeTelemetryAgentLogOn" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Office\OfficeTelemetryAgentLogOn" >nul 2>&1


:: OfficeTelemetryAgentLogOn2016 is OfficeTelemetryAgentLogOn, updated for Microsoft Office 2016. 
echo Stopping and deleting OfficeTelemetryAgentLogOn2016 (if it exists)...
schtasks /Change /TN  "Microsoft\Office\OfficeTelemetryAgentLogOn2016" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Office\OfficeTelemetryAgentLogOn2016" >nul 2>&1 


 :: AgentFallBack2016 is OfficeTelemetryAgentFallBack, updated for Microsoft Office 2016.
echo Stopping and deleting OfficeTelemetryAgentFallBack, (if it exists)...
schtasks /Change /TN  "Microsoft\Office\OfficeTelemetry\AgentFallBack2016" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Office\OfficeTelemetry\AgentFallBack2016" >nul 2>&1

 
:: OfficeTelemetryAgentFallBack is part of Telemetry, and stores user data and events that occur during use of Microsoft Office.
echo Stopping and deleting OfficeTelemetryAgentFallBack (if it exists)...
schtasks /Change /TN  "Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentFallBack" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentFallBack" >nul 2>&1

 
:: OfficeTelemetryAgentFallBack2016 is OfficeTelemetryAgentFallBack, updated for Microsoft Office 2016.
echo Stopping and deleting OfficeTelemetryAgentFallBack2016 (if it exists)...
schtasks /Change /TN  "Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentFallBack2016" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentFallBack2016" >nul 2>&1

 
:: OfficeTelemetryAgentLogOn is part of Telemetry, and stores user data and events that occur during use of Microsoft Office.
echo Stopping and deleting OfficeTelemetryAgentLogOn (if it exists)...
schtasks /Change /TN  "Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentLogOn" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentLogOn" >nul 2>&1

 
:: OfficeTelemetryAgentLogOn2016 is OfficeTelemetryAgentLogOn updated for Microsoft Office 2016.
echo Stopping and deleting OfficeTelemetryAgentLogOn2016 (if it exists)...
schtasks /Change /TN  "Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentLogOn2016" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentLogOn2016" >nul 2>&1

 
:: Office 15 Subscription Heartbeat is part of Microsoft's Health Service program, and sends data to Microsoft about the status of Microsoft Office subscriptions.
echo Stopping and deleting Office 15 Subscription Heartbeat (if it exists)...
schtasks /Change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /DISABLE >nul 2>&1
schtasks /delete /F "Microsoft\Office\Office 15 Subscription Heartbeat" >nul 2>&1


 :: SmartScreenSpecific collects user and system data and for Windows SmartScreen and sends it to Microsoft.
echo Stopping and deleting SmartScreenSpecific (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\AppID\SmartScreenSpecific" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\AppID\SmartScreenSpecific" >nul 2>&1


 :: Microsoft Compatibility Appraiser scans the system to determine if system programs and apps are compatible with Windows 10, and reports that data to Microsoft. 
echo Stopping and deleting Microsoft Compatibility Appraiser (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" >nul 2>&1

 
:: AitAgent is part of Telemetry, and sends user and application data to Microsoft. 
echo Stopping and deleting AitAgent (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Application Experience\AitAgent" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Application Experience\AitAgent" >nul 2>&1


:: ProgramDataUpdater sends user and application data to Microsoft to analyze system errors and check for updates to installed programs.
echo Stopping and deleting ProgramDataUpdater (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Application Experience\ProgramDataUpdater" >nul 2>&1


:: StartupAppTask scans startup entries and sends that data to Microsoft. 
echo Stopping and deleting StartupAppTask (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Application Experience\StartupAppTask" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Application Experience\StartupAppTask" >nul 2>&1 

 
:: Autochk Proxy collects and sends autochk SQM data (Software Quality Metrics) to Microsoft.
echo Stopping and deleting Autochk Proxy (if it exists)... 
schtasks /Change /TN  "Microsoft\Windows\Autochk\Proxy" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Autochk\Proxy" >nul 2>&1
 

:: BthSQM collects and reports Software Quality Metrics about Bluetooth usage and connected devices to Microsoft as part of the Customer Experience Improvement Program. 
echo Stopping and deleting BthSQM (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" >nul 2>&1  


:: Consolidator collects Software Quality Metrics and sends them to Microsoft as part of the Customer Experience Improvement Program. 
echo Stopping and deleting Consolidator (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" >nul 2>&1

 
:: KernelCeipTask collects system data and analytics and sends them to Microsoft as part of the Customer Experience Improvement Program.
echo Stopping and deleting KernelCeipTask (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" >nul 2>&1

 
:: UsbCeip collects USB-related system data and other analytics and sends them to Microsoft as part of the Customer Experience Improvement Program.
echo Stopping and deleting UsbCeip (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" >nul 2>&1

 
:: Microsoft-Windows-DiskDiagnosticDataCollector reports general disk and system information to Microsoft as part of the Customer Experience Improvement Program.
echo Stopping and deleting DiskDiagnosticDataCollector (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" >nul 2>&1

 
:: Diagnostics collects disk information and drive usage. It may also cause high CPU utilization.
echo Stopping and deleting Diagnostics (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\DiskFootprint\Diagnostics" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\DiskFootprint\Diagnostics" >nul 2>&1


:: File History backs up and stores user files in case of accidental deletion or loss. This can lead to sensitive data being kept on the host machine even after its supposed deletion. 
echo Stopping and deleting File History (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\FileHistory\File History (maintenance mode)" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\FileHistory\File History (maintenance mode)" >nul 2>&1 
 

:: WinSAT records and stores data about system performance. 
echo Stopping and deleting WinSAT (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Maintenance\WinSAT" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Maintenance\WinSAT" >nul 2>&1
 

:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting ActivateWindowsSearch (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\ActivateWindowsSearch" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\ActivateWindowsSearch" >nul 2>&1


:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting ConfigureInternetTimeService (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\ConfigureInternetTimeService" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\ConfigureInternetTimeService" >nul 2>&1


:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting DispatchRecoveryTasks (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\DispatchRecoveryTasks" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\DispatchRecoveryTasks" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting InstallPlayReady (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\InstallPlayReady" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\InstallPlayReady" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting MediaCenterRecoveryTask (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\MediaCenterRecoveryTask" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\MediaCenterRecoveryTask" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting OCURActivate (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\OCURActivate" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\OCURActivate" >nul 2>&1
 

:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting OCURDiscovery (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\OCURDiscovery" /DISABLE >nul 2>&1 
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\OCURDiscovery" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting ObjectStoreRecoveryTask (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\ObjectStoreRecoveryTask" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\ObjectStoreRecoveryTask" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting PBDADiscovery (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\PBDADiscovery" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\PBDADiscovery" >nul 2>&1
 

:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting PBDADiscoveryW1 (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\PBDADiscoveryW1" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\PBDADiscoveryW1" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting PBDADiscoveryW2 (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\PBDADiscoveryW2" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\PBDADiscoveryW2" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting PvrRecoveryTask (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\PvrRecoveryTask" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\PvrRecoveryTask" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting PvrScheduleTask (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\PvrScheduleTask" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\PvrScheduleTask" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting RegisterSearch (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\RegisterSearch" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\RegisterSearch" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting ReindexSearchRoot (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\ReindexSearchRoot" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\ReindexSearchRoot" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting SqlLiteRecoveryTask (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\SqlLiteRecoveryTask" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\SqlLiteRecoveryTask" >nul 2>&1

 
:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting UpdateRecordPath (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\UpdateRecordPath" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\UpdateRecordPath" >nul 2>&1


:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting ehDRMInit (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\ehDRMInit" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\ehDRMInit" >nul 2>&1


:: None of the Media Center tasks seem necessary, and a majority of them require the system to be connected to the internet. That, in addition to the Media Center's Private Policy, warrants their deletion.
echo Stopping and deleting mcupdate (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Media Center\mcupdate" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Media Center\mcupdate" >nul 2>&1


:: MNO Metadata Parser involves metadata collection and monitoring, and is part of the Mobile Broadband Account Experience Program.
echo Stopping and deleting MNO Metadata Parser (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" >nul 2>&1

 
:: GatherNetworkInfo collects and stores detailed system information, for unspecified reasons.
echo Stopping and deleting GatherNetworkInfo (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\NetTrace\GatherNetworkInfo" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\NetTrace\GatherNetworkInfo" >nul 2>&1


:: SQM-Tasks gathers information about the Trusted Platform Module (TPM), Secure Boot, and Measured Boot.
echo Stopping and deleting SQM-Tasks (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\PI\Sqm-Tasks" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\PI\Sqm-Tasks" >nul 2>&1


:: Secure-Boot-Update updates Microsoft's Secure Boot features. These features force the use of signed operating systems - most notably, Microsoft's Windows. 
echo Stopping and deleting Secure-Boot-Update (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\PI\Secure-Boot-Update" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\PI\Secure-Boot-Update" >nul 2>&1


:: AnalyzeSystem scans the system and reports applications, features, and programs that may cause high power-consumption.
echo Stopping and deleting AnalyzeSystem (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" >nul 2>&1


:: RacTask gathers and stores system stability information every hour (i.e. - crashes, errors, etc.). 
echo Stopping and deleting RacTask (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\RAC\RacTask" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\RAC\RacTask" >nul 2>&1


:: LaunchTrayProcess is part of the "Get Windows 10" program that com es bundled with some updates. 
echo Stopping and deleting LaunchTrayProcess (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Setup\gwx\LaunchTrayProcess" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Setup\gwx\LaunchTrayProcess" >nul 2>&1

 
:: RefreshGwxConfig is part of the "Get Windows 10" program that comes bundled with some updates. 
echo Stopping and deleting RefreshGwxConfig (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Setup\gwx\RefreshGwxConfig" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Setup\gwx\RefreshGwxConfig" >nul 2>&1


:: RefreshGwxConfigandContent is part of the "Get Windows 10" program that comes bundled with some updates. 
echo Stopping and deleting RefreshGwxConfigandContent (if it exists)...
schtasks /Change /TN "\Microsoft\Windows\Setup\gwx\refreshgwxconfigandcontent" /DISABLE >nul 2>&1
schtasks /delete /F /TN "\Microsoft\Windows\Setup\gwx\refreshgwxconfigandcontent" >nul 2>&1


:: RefreshGwxContent is part of the "Get Windows 10" program that comes bundled with some updates. 
echo Stopping and deleting RefreshGwxContent (if it exists)...
schtasks /Change /TN "\Microsoft\Windows\Setup\gwx\refreshgwxcontent" /DISABLE >nul 2>&1
schtasks /delete /F /TN "\Microsoft\Windows\Setup\gwx\refreshgwxcontent" >nul 2>&1


:: FamilySafetyMonitor is part of Microsoft's Parental Controls Features. 
echo Stopping and deleting FamilySafetyMonitor (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Shell\FamilySafetyMonitor" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Shell\FamilySafetyMonitor" >nul 2>&1

 
:: FamilySafetyRefresh is part of Microsoft's Parental Controls Features. 
echo Stopping and deleting FamilySafetyRefresh (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Shell\FamilySafetyRefresh" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Shell\FamilySafetyRefresh" >nul 2>&1

 
:: FamilySafetyUpload is part of Microsoft's Parental Controls Features.
echo Stopping and deleting FamilySafetyUpload (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Shell\FamilySafetyUpload" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Shell\FamilySafetyUpload" >nul 2>&1


:: GadgetManager collects and storers metadata for installed gadgets on Windows SideShow-compatible devices.
echo Stopping and deleting GadgetManager (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\SideShow\GadgetManager" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\SideShow\GadgetManager" >nul 2>&1


:: HiveUploadTask uploads a roaming user profile’s registry hive to a location on the user's network.
echo Stopping and deleting HiveUploadTask (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\User Profile Service\HiveUploadTask" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\User Profile Service\HiveUploadTask" >nul 2>&1


:: QueueReporting sends errors and system data pertaining to those errors to Microsoft for analysis.  
echo Stopping and deleting QueueReporting (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\Windows Error Reporting\QueueReporting" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\Windows Error Reporting\QueueReporting" >nul 2>&1

 
:: ConfigNotification notifies users that Windows Backup has either been disabled, or not yet configured.
echo Stopping and deleting ConfigNotification (if it exists)...
schtasks /Change /TN  "Microsoft\Windows\WindowsBackup\ConfigNotification" /DISABLE >nul 2>&1
schtasks /delete /F /TN  "Microsoft\Windows\WindowsBackup\ConfigNotification" >nul 2>&1


:End
echo.
echo RemoveSchTasks is now complete.
TIMEOUT 20