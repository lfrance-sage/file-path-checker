# file-path-checker powershell script

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

