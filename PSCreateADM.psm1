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

function New-ADMTemplate
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
function New-ADMCategory
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
function New-ADMPolicy
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
function New-ADMPolicyPart
{
    [Alias()]
    [OutputType([PolicyPart])]
    Param
    (
        [string]
        $Name = "Untitled GPO Policy",

        [string]
        $KeyName = "",

        [string]
        $ValueName = "",

        [ValidateSet("CHECKBOX", "DROPDOWNLIST", "EDITTEXT", "NUMERIC")]
        [string]
        $Type = "Example explination",
        
        [string]
        $ValueOn = "True",

        [string]
        $ValueOff = "False"
    )

    $Properties = @{
        Name = $Name;
        KeyName = $KeyName;
        ValueName = $ValueName;
        Type = $Type;
        ValueOn = $ValueOn;
        ValueOff = $ValueOff;
    }

    New-Object -TypeName PolicyPart -Property $Properties
}
function New-ADMPolicyItemList
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
function Export-ADMPolicy
{
    [Alias()]
    [OutputType([string])]
    Param
    (
        [string]
        $Name = "Untitled GPO Policy",

        [Template]
        $Template,

        [string]
        $OutPath,

        [switch]
        $Force
    )


    [string[]]$Output = ""
    $Indent = "    "

    $Template | Sort-Object -Property Type | Foreach {
        $Output += "CLASS " + $_.Type

        foreach ($Category in $_.Category) {
            $Output += "CATEGORY " + $Category.Name

            foreach ($Policy in $Category.Policy) {
                $Output += $Indent + "POLICY '" + $Policy.Name + "'"
            
                if ($Policy.KeyName) {
                    $Output += $Indent*2 + "KEYNAME '" + $Policy.KeyName + "'"
                }
            
                if ($Policy.Explination) {
                    $Output += $Indent*2 + "EXPLAIN '" + $Policy.Explination + "'"
                }

                if ($Policy.ValueName) {
                    $Output += $Indent*2 + "VALUENAME '" + $Policy.ValueName + "'"
                }
            
                if ($Policy.ValueOn) {
                    $Output += $Indent*2 + "VALUEON '" + $Policy.ValueOn + "'"
                }

                if ($Policy.ValueOff) {
                    $Output += $Indent*2 + "VALUEOFF '" + $Policy.ValueOff + "'"
                }

                foreach ($PolicyPart in $Policy.PolicyPart) {
                    $Output += $Indent*2 + "PART '" + $PolicyPart.Name + "' " + $PolicyPart.Type

                    if ($PolicyPart.ValueName) {
                        $Output += $Indent*3 + "VALUENAME '" + $PolicyPart.ValueName + "'"
                    }
                
                    if ($PolicyPart.ValueOn) {
                        $Output += $Indent*3 + "VALUEON '" + $PolicyPart.ValueOn + "'"
                    }

                    if ($PolicyPart.ValueName) {
                        $Output += $Indent*3 + "VALUEOFF '" + $PolicyPart.ValueOff + "'"
                    }

                    $Output += $Indent*2 + "END PART"
                }

                $Output += $Indent + "END POLICY"
            }

            $Output += "END CATEGORY"
        }
    }

    if($OutPath) {
        $Output | Out-File -FilePath $OutPath -Force:$Force
    }

    $Output

}

Export-ModuleMember -Function New-ADMCategory
Export-ModuleMember -Function New-ADMPolicy
Export-ModuleMember -Function New-ADMPolicyItemList
Export-ModuleMember -Function New-ADMPolicyPart
Export-ModuleMember -Function New-ADMTemplate