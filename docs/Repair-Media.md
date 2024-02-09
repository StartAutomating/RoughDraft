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

---

### Syntax
```PowerShell
Repair-Media [-InputPath] <String[]> [[-OutputPath] <String>] [<CommonParameters>]
```
