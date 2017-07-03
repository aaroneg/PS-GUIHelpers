Function Show-FileOpenDialog{   
<#
	.SYNOPSIS
		The Show-FileOpenDialog function opens a save file dialog.
	.DESCRIPTION
		The Show-FileOpenDialog function opens a save file dialog.
	.PARAMETER initialDirectory
		Specifies a default folder other than the current folder
	.PARAMETER filter
		Specifies a file filter, like 'Applications| *.exe'. If this is not specified, the type will be CSV
    .PARAMETER windowTitle
        Specifies the title of the file Open dialog
	.EXAMPLE
		Show-FileOpenDialog
        
		Opens a Open File dialog in the current working directory
	.EXAMPLE
		Show-FileOpenDialog -initialDirectory c:\ -filter "Powershell Module (*.psm1)| *.psm1" -windowTitle "Load Powershell Module File"
        
		This will look under c:\ for powershell modules, with a window title
		
    .Notes 
        $FilePath=Show-FileOpenDialog -initialDirectory c:\ -filter "CSV File| *.csv" -windowTitle "Load Spreadsheet"
        $DefaultSavePath=($FilePath|Split-Path -Parent)
        $ResultFile=Show-FileSaveDialog -filter "CSV File| *.csv" -windowTitle "Save Result Spreadsheet" -initialDirectory $DefaultSavePath -outPutFileName "Results.csv"
	
		This will Open a spreadsheet, save it's path as the default save path, and prompt the user to save the results as a spreadsheet in the folder the last 
        spreadsheet was opened from.


#>
    [CmdletBinding()]
    Param(
    [string]$initialDirectory,
    [string]$filter='CSV (*.csv)| *.csv',
    [string]$windowTitle="Open Spreadsheet"
    )

 [System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') |
 Out-Null
 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.Title = $windowTitle
 $OpenFileDialog.filter = $filter
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
} 
