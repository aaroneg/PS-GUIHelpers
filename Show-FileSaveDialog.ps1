Function Show-FileSaveDialog {
<#
	.SYNOPSIS
		The Set-FileName function opens a save file dialog.
	.DESCRIPTION
		The Set-FileName function opens a save file dialog to use later in the script
	.PARAMETER initialDirectory
		Specifies a starting directory other than the current working directory
	.PARAMETER filter
		Specifies a file name filter like "Visual Basic Script | *.vbs". If this is not specified, the type will be CSV.
    .PARAMETER windowTitle
        Specifies the title of the file save dialog
    .PARAMETER outputFileName
        Allows a filename suggestion
	.EXAMPLE
		Set-FileName
        
		Opens a Save File dialog in the current working directory
	.EXAMPLE
		Set-FileName -initialDirectory c:\ -filter 'Powershell Module (*.psm1)| *.psm1' -windowTitle "Load Powershell Module File" -outPutFileName "MyModule.psm1"
        
		This will look under c:\ for powershell modules, with a window title, and suggested filename of "MyModule.psm1"
#>
    [CmdletBinding()]
    Param(
    [string]$initialDirectory,
    [string]$filter='CSV (*.csv)| *.csv',
    [string]$windowTitle="Save Spreadsheet",
    [string]$outPutFileName=''    
    )   

 [System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null

 $SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
 $SaveFileDialog.initialDirectory = $initialDirectory
 $SaveFileDialog.Title = 'Save Result Spreadsheet'
 $SaveFileDialog.filter = $filter
 $SaveFileDialog.filename = $outPutFileName
 $SaveFileDialog.ShowDialog() | Out-Null
 $SaveFileDialog.filename
}

