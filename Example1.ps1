# Example 1

$PolicyPart = New-ADMPolicyPart -Name "Test" -KeyName "Software\HP\HP Easy Shell" -ValueName "TestPart" -Type "CHECKBOX"
$Policy = New-ADMPolicy -Name "Test" -KeyName "Software\HP\HP Easy Shell" -ValueName "KioskMode" -Explination "Test" -ValueOn "True" -ValueOff "False" -PolicyPart $PolicyPart
$Policy2 = New-ADMPolicy -Name "Test" -KeyName "Software\HP\HP Easy Shell" -ValueName "KioskMode" -Explination "Test" -ValueOn "True" -ValueOff "False"
$Category = New-ADMCategory -Name "FuckItLetsTest" -Policy $Policy,$Policy2
$Template = New-ADMTemplate -Name "FuckIt" -Type Machine -Category $Category

Export-ADMPolicy -Name "Test" -Template $Template
