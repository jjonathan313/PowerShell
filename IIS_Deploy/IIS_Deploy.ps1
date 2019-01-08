<#
.SYNOPSIS
  <Overview of script>

.DESCRIPTION
  <Brief description of script>

.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        1.0
  Author:         <Name>
  Creation Date:  <Date>
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>

.TODO
  - Ask for local "from" folder with web code - test access to directory -FromDirectory "string" use in script config and if parameter is not defiened, use settings
  - Ask for remote "to" folder with web code - test access to directory and ask for creds if access is denied, error out if error again -ToDirectory use in script config and if parameter is not defiened, use settings
  - Create app_offline.htm to take the site down before migration (ask for confirmation) -CreateAppOffline
  - Make backup of previous installation to given directory (zip file - ask for confirmation) -CreateBackup
  - get file sizes and tree data (display folders and size and a "files" and its size) -LogFileSizes
  - get all file hashes for each file, ompare hashes between old and new files, ask to display changes -LogFileChanges
  - copy new files to remote directory, time how long it takes (ask for confirmation of overwrite) -CopyFiles -ConfirmOverwrite
  - enable ignore of certain files -IgnoreFiles @("","")
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

$settings = @{

}

#Script Version
$sScriptVersion = "1.0"

#-----------------------------------------------------------[Functions]------------------------------------------------------------


#-----------------------------------------------------------[Execution]------------------------------------------------------------
