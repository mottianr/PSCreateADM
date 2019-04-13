class Template
{
    [string] $Name

    [ValidateSet("Machine", "User")]
    [string] $Type

    [Category[]] $Category
}
class Category
{
    [string] $Name
    [Policy[]] $Policy
}
class Policy
{
    [string] $Name
    [string] $KeyName
    [string] $ValueName
    [string] $Explination
   
    [string] $ValueOn
    [string] $ValueOff
    [PolicyPart[]] $PolicyPart
}
class PolicyPart
{
   # Property with validate set
   [ValidateSet("CHECKBOX", "DROPDOWNLIST", "EDITTEXT", "NUMERIC")]
   [string] $Type

   [string] $Name
   [string] $KeyName
   [string] $ValueName
   
   [string] $ValueOn
   [string] $ValueOff
}
class ItemList
{
   [string] $Name
   [string] $Value
   [string] $Default
}

function New-GPOTemplate
{
    [Alias()]
    [OutputType([Template])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [string]
        $Name = "Untitled GPO Template",

        [ValidateSet("Machine", "User")]
        [String]
        $Type,

        [Category[]]
        $Category
    )

    $Properties = @{
        Name = $Name;
        Type = $Type;
        Category = $Category;
    }

    New-Object -TypeName Template -Property $Properties
}
function New-GPOCategory
{
    [Alias()]
    [OutputType([Category])]
    Param
    (
        [string]
        $Name = "Untitled GPO Category",

        [Policy[]]
        $Policy
    )

    $Properties = @{
        Name = $Name;
        Policy = $Policy;
    }

    New-Object -TypeName Category -Property $Properties
}
function New-GPOPolicy
{
    [Alias()]
    [OutputType([Policy])]
    Param
    (
        [string]
        $Name = "Untitled GPO Policy",

        [string]
        $KeyName,

        [string]
        $ValueName,

        [string]
        $Explination = "Example explination",
        
        [string]
        $ValueOn = "True",

        [string]
        $ValueOff = "False",

        [PolicyPart[]]
        $PolicyPart
    )

    $Properties = @{
        Name = $Name;
        KeyName = $KeyName;
        ValueName = $ValueName;
        Explination = $Explination;
        ValueOn = $ValueOn;
        ValueOff = $ValueOff;
        PolicyPart = $PolicyPart;
    }

    New-Object -TypeName Policy -Property $Properties
}
function New-GPOPolicyPart
{
    [Alias()]
    [OutputType([PolicyPart])]
    Param
    (
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [string]
        $Name = "Untitled GPO Policy",

        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=1,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [string]
        $KeyName,

        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=2,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [string]
        $ValueName,

        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=2,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")]
        [ValidateSet("CHECKBOX", "DROPDOWNLIST", "EDITTEXT", "NUMERIC")]
        [string]
        $Type = "Example explination",
        
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=2,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [string]
        $ValueOn = "True",

        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=2,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [string]
        $ValueOff = "False"
    )

    $Properties = @{
        Name = $Name;
        KeyName = $KeyName;
        ValueName = $ValueName;
        Explination = $Explination;
        ValueOn = $ValueOn;
        ValueOff = $ValueOff;
        PolicyPart = $PolicyPart;
    }

    New-Object -TypeName PolicyPart -Property $Properties
}
function New-GPOPolicyItemList
{
    [Alias()]
    [OutputType([ItemList])]
    Param
    (
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [string]
        $Name = "Untitled GPO Policy",

        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=1,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [string]
        $Value,

        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=2,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [string]
        $Default
    )

    $Properties = @{
        Name = $Name;
        Value = $Value;
        Default = $Default;
    }

    New-Object -TypeName ItemList -Property $Properties
}
function Export-GPOPolicy
{
    [Alias()]
    [OutputType([string])]
    Param
    (
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [string]
        $Name = "Untitled GPO Policy",

        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=1,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("p1")] 
        [Template]
        $Template
    )

    $Properties = @{
        Name = $Name;
        Value = $Value;
        Default = $Default;
    }

    New-Object -TypeName ItemList -Property $Properties
}


# $PolicyPart = New-GPOPolicyPart -Name "Test" -KeyName "Software\HP\HP Easy Shell"
$Policy = New-GPOPolicy -Name "Test" -KeyName "Software\HP\HP Easy Shell" -ValueName "KioskMode" -Explination "Test" -ValueOn "True" -ValueOff "False"
$Category = New-GPOCategory -Name "FuckItLetsTest" -Policy $Policy
$Template = New-GPOTemplate -Name "FuckIt" -Type Machine -Category $Category

[string[]]$Output

$Template | Sort-Object -Property Type | Foreach {
    $Output += "CLASS $Type"
    foreach ($Category in $_.Category) {
        foreach ($Policy in $Category.Policy) {
            # foo
        }
    }
}




