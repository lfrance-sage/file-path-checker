<#
  .SYNOPSIS
    File path checker

  .DESCRIPTION
  The script checks all the file paths are correct. It will tell you if its valid or invalid. It will also provide a count. 


  .EXAMPLE
   Input:
   .\file-path-checker.ps1 -FilePaths "C:\Users\luka.france\Desktop\StartUp.ps1", "C:\Users\luka.france\Desktop\DeleteFiles.ps1"
   
   Output:
    C:\Users\luka.france\Desktop\StartUp.ps1 exists.
    C:\Users\luka.france\Desktop\DeleteFiles.ps1 does not exist.

    Total files checked: 2
    Total valid files: 1
    Total invalid files: 1
    Some files do not exist
#>


[CmdletBinding()]
param(
    [string[]]$FilePaths,
    [switch]$Force
)

$ValidFilePaths = @()
$InvalidFilePaths = @()

foreach ($file in $FilePaths) {
    try {
        if (Test-Path $file -PathType Leaf) {
            Write-Host "$file exists." -ForegroundColor Green
            $ValidFilePaths += $file
        } else {
            Write-Host "$file does not exist." -ForegroundColor Red
            $InvalidFilePaths += $file
        }
    } catch {
        Write-Host "Error checking $($file): $($_.Exception.Message)" -ForegroundColor Red
        $InvalidFilePaths += $file
    }
}

Write-Host ""
Write-Host "Total files checked: $($FilePaths.Count)" -ForegroundColor Yellow
Write-Host "Total valid files: $($ValidFilePaths.Count)" -ForegroundColor Green
Write-Host "Total invalid files: $($InvalidFilePaths.Count)" -ForegroundColor Red

if ($InvalidFilePaths.Count -eq 0) {
    Write-Host "All files exist." -ForegroundColor Green
   
} else {
    Write-Host "Some files do not exist" -ForegroundColor Red
    exit
}
