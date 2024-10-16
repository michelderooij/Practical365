Try {

  Try {
    Get-Mailbox -Identity doesnotexist@contoso.com -ErrorAction Stop
  }
  Catch {
    Write-Error( 'Get-Mailbox failed' -f $_.Exception.Message)
  }

}
Catch {
    Write-Error( 'The whole operation failed')
}