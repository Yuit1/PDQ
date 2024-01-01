$LanguageList = Get-WinUserLanguageList
$LanguageList.Add("en-US")
Set-WinUILanguageOverride "en-US"
Set-WinUserLanguageList $LanguageList

$LanguageList = Get-WinUserLanguageList
$LanguageToRemove = $LanguageList | Where-Object { $_.LanguageTag -eq "pt-BR" }
$LanguageList.Remove($LanguageToRemove)
Set-WinUserLanguageList $LanguageList

Set-WinUILanguageOverride en-US
Set-WinUserLanguageList pt-BR -Force
