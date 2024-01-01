#Verifica se a pasta existe, se não ele cria ela
If (test-path "c:\Monitor1.9"){
Start-Sleep -Seconds 20 #espera 20 segundos para não congestionar o processo da máquina
Exit
} Else {
New-Item -Path c:\Monitor1.9 -ItemType directory

#Copia a pasta toda, arquivo por arquivo para a pasta criada
copy-item "\\SeuDominio\NETLOGON\pasta1\pasta2\Monitor\arquivos\Config.config" -Destination "c:\Monitor1.9" -force
copy-item "\\SeuDominio\NETLOGON\pasta1\pasta2\Monitor\arquivos\Monitor.exe" -Destination "c:\Monitor1.9" -force
copy-item "\\SeuDominio\NETLOGON\pasta1\pasta2\Monitor\arquivos\Monitor.ps1" -Destination "c:\Monitor1.9" -force
copy-item "\\SeuDominio\NETLOGON\pasta1\pasta2\Monitor\arquivos\run.vbs" -Destination "c:\Monitor1.9" -force
copy-item "\\SeuDominio\NETLOGON\pasta1\pasta2\Monitor\arquivos\run.bat" -Destination "c:\Monitor1.9" -force


#ConfigMonitorConnectionIPCC
copy-item "\\SeuDominio\NETLOGON\pasta1\pasta2\Monitor\arquivos\Config.config" -Destination "C:\Program Files (x86)\pasta10\NomedoObjeto" -force

#runExe/runPs1
copy-item "\\SeuDominio\NETLOGON\pasta1\pasta2\Monitor\arquivos\run.vbs" -Destination "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" -force
copy-item "\\SeuDominio\NETLOGON\pasta1\pasta2\Monitor\arquivos\run.bat" -Destination "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" -force

#MonitorConnectionIPCC
copy-item "\\SeuDominio\NETLOGON\pasta1\pasta2\Monitor\arquivos\Monitor.exe" -Destination "C:\Program Files (x86)\pasta10\NomedoObjeto" -force
}
