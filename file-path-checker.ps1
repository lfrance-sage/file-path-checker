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
