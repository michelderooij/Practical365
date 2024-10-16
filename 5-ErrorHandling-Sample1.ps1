[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({ Test-Path $_})]
    [string]$CsvFile
)
$Users= Import-Csv -Path $CsvFile

ForEach( $User in $Users){
    Write-Host( 'Fetching mailbox {0}' -f $User.Identity)
    Try {
        $MailboxObj= Get-Mailbox -Identity $User.Identity -ErrorAction Stop
        $UserObj= Get-User -Identity $User.Identity -ErrorAction Stop
    }
    Catch [System.Exception] {
        Write-Error( 'System Exception called for {0}: {1}' -f $User.Identity, $_.Exception.Message)
    }
    Catch {
        Write-Error( '{0}: {1}' -f $User.Identity, $_.Exception.Message)
    }
    Finally {
        # Finally
    }
}

