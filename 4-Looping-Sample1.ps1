$TotalItems= 0
[array]$Users = Get-User -RecipientTypeDetails UserMailbox
For( $i=0; $i -lt $Users.count; $i++) {
    $TotalItems+= (Get-ExoMailboxStatistics -Identity $Users[ $i].externalDirectoryObjectId).ItemCount
}
$Avg= $TotalItems / $Users.Count
Write-Host ('Avg. Itemcount: {0}' -f $Avg)
