“C:\Program Files\7-Zip\7z.exe” x “C:\Images\en_biztalk_server_2013_r2_enterprise_edition_x86_and_x64_dvd_4434625.iso” -oc:\Images\BTS\ * -r -y

powershell Install-WindowsFeature Net-Framework-Core -source \\pdc\delt\install\Biztalk-Deploy-master\bin\sxs\sxs
\\pdc\delt\install\Biztalk-Deploy-master\bin\VCRedist\x64\vcredist.exe /install /passive
\\pdc\delt\install\Biztalk-Deploy-master\bin\VCRedist\x86\vcredist.exe /install /passive
“\\pdc\delt\install\BTS_2016_Dev\BizTalk Server\setup.exe” /PASSIVE /NORESTART /CABPATH \\pdc\delt\install\Biztalk-Deploy-master\bin\BtsRedistW2K12R2EN64\BtsRedistW2K12R2EN64.cab /ADDLOCAL SSOAdmin,SSOSERVER
“\\pdc\delt\install\BTS_2016_Dev\BizTalk Server\setup.exe” /PASSIVE /NORESTART /CABPATH \\pdc\delt\install\Biztalk-Deploy-master\bin\BtsRedistW2K12R2EN64\BtsRedistW2K12R2EN64.cab /ADDLOCAL BizTalk,WMI,AdminAndMonitoring,AdminTools,BAMTools,BizTalkAdminSnapIn,HealthActivityClient,MonitoringAndTracking,PAM,Documentation,BizTalk,WMI,Engine,MOT,MSMQ,Runtime
“C:\Program Files (x86)\Microsoft BizTalk Server 2013 R2\Configuration.exe” /S C:\Images\BizTalkConfig.xml


msiexec.exe /i “C:\Images\BTS\BizTalk Server\LOB\Msi\Microsoft_BizTalk_Adapters_for_Enterprise_Applications.msi” /norestart /qn /lv c:\lob.log

msiexec.exe /i “C:\Images\BTS\BizTalk Server\ASDK_x86\AdapterFramework.msi” /quiet MUOPTIN=”Yes”

msiexec.exe /i “C:\Images\BTS\BizTalk Server\ASDK_x64\AdapterFramework64.msi” /quiet MUOPTIN=”Yes”

msiexec.exe /i “C:\Images\BTS\BizTalk Server\AdapterPack_x86\AdaptersSetup.msi” /qn

msiexec.exe /i “C:\Images\BTS\BizTalk Server\AdapterPack_x64\AdaptersSetup64.msi” /qn

msiexec.exe /i “C:\Images\BTS\BizTalk Server\ESBT_x64\BizTalk ESB Toolkit 2.3.msi” /qn

rmdir c:\Images\BTS /S /Q