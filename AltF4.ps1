REG query "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout"

REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "ScancodeMap" /f
