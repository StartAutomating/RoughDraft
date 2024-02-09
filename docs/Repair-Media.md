Repair-Media
------------

### Synopsis
Repairs Media

---

### Description

Repairs Media using any number of extensions.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ChildItem -Filter *.m3u | Repair-Media -FixPlayListPath
```

---

### Parameters
#### **InputPath**
One or more input paths

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|true    |1       |true (ByPropertyName)|Fullname|

#### **OutputPath**
An optional output path

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Repair-Media [-InputPath] <String[]> [[-OutputPath] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
