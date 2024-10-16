$TotalItems= 0
$Users= Get-User -RecipientTypeDetails UserMailbox
ForEach( $User in $Users) {
    $TotalItems+= (Get-ExoMailboxStatistics -Identity $User.externalDirectoryObjectId).ItemCount
}
$Avg= $TotalItems / $Users.Count
Write-Host ('Avg. Itemcount: {0}' -f $Avg)
