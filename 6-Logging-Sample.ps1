

Function Write-Log {
    param(
        [string]$Message='',
        [ValidateSet('Info','Warning', 'Error', 'Success', 'Verbose', 'Debug')]
        [string]$Severity= 'Info',
        [switch]$LogToFile,
        [string]$LogFileName
    )

    If(!( $LogFileName)) {
        # LogFile parameter not specified (null), so determine one
        $LogFolder= $PSScriptRoot
        $LogName= Split-Path -Path $MyInvocation.ScriptName -LeafBase
        $LogFileName= Join-Path -Path $LogFolder -ChildPath ('{0}-{1}.log' -f [string](Get-Date -format "yyyyMMdd"), $LogName)
    }
    Switch( $Severity) {
        'Warning' {
            $FormattedMessage= '[WARNING] {0}' -f $Message
            Write-Host $FormattedMessage -ForegroundColor $host.PrivateData.WarningForegroundColor -BackgroundColor $host.PrivateData.WarningBackgroundColor
        }
        'Error' {
            $FormattedMessage= '[ERROR] {0}' -f $Message
            Write-Host $FormattedMessage -ForegroundColor $host.PrivateData.ErrorForegroundColor -BackgroundColor $host.PrivateData.ErrorBackgroundColor         
        }
        'Verbose' {
            $FormattedMessage= '[VERBOSE] {0}' -f $Message
            Write-Host $FormattedMessage -ForegroundColor $host.PrivateData.VerboseForegroundColor -BackgroundColor $host.PrivateData.VerboseBackgroundColor
        }
        'Debug' {
            # Only log debug messages if we want debug stream to show
            If( $DebugPreference -ine 'SilentlyContinue') {
                $FormattedMessage= '[DEBUG] {0}' -f $Message
                Write-Host $FormattedMessage -ForegroundColor $host.PrivateData.DebugForegroundColor -BackgroundColor $host.PrivateData.DebugBackgroundColor
            }
            # Never log debug messages to file
            $LogToFile= $false
        }
        Default {
            $FormattedMessage= '[INFO] {0}' -f $Message
            Write-Host $FormattedMessage 
        }
    }
    If( $LogToFile) {
        [pscustomobject]@{
             Time = [string](Get-Date -format 'yyyyMMddHHmmss')
             Severity = $Severity
             Message = $Message
        } | Export-Csv -Path $LogFileName -Append -NoTypeInformation    
    }
}

# Write a log entry to console and file
Write-Log -Message 'This is an informational message' -LogToFile