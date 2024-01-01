# Inicia o processo de desinstalação do programa StopUpdates10 de forma silenciosa e aguarda sua conclusão.
Start-Process -FilePath "C:\Program Files (x86)\StopUpdates10\unins000.exe" -ArgumentList "/SILENT" -NoNewWindow -Wait 

# Configura o serviço UsoSvc para iniciar automaticamente e o inicia.
Set-Service -Name UsoSvc -StartupType Automatic
Set-Service -Name UsoSvc -Status running

# Define a propriedade de inicialização do serviço WaaSMedicSvc como 3 (Automático).
Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc -name Start -Value 3

# Configura o serviço WaaSMedicSvc para iniciar.
Set-Service -Name WaaSMedicSvc -Status running


# Verifica se a chave do Registro que controla a pausa nas atualizações de recursos (feature updates) está presente.
If (-not (test-path -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings\PauseFeatureUpdatesEndTime)){
    # Se a chave não existe, encerra o script.
    exit
} Else {
    # Se a chave existe, remove várias propriedades relacionadas à pausa nas atualizações.
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState -name PauseFeatureUpdatesEndTime
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState -name PauseQualityUpdatesEndTime
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState -name PauseFeatureUpdatesStartTime
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState -name PauseQualityUpdatesStartTime

    # Remove propriedades relacionadas à pausa nas atualizações do Registro.
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -name PauseFeatureUpdatesEndTime 
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -name PauseQualityUpdatesEndTime 
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -name PauseFeatureUpdatesStartTime 
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -name PauseQualityUpdatesStartTime 
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -name PauseUpdatesExpiryTime 

}
