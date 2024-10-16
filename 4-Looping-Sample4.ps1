$TotalItems= 0
$Users= Get-User -RecipientTypeDetails UserMailbox $Users.ForEach{ 
    $TotalItems+= (Get-ExoMailboxStatistics -Identity $_.externalDirectoryObjectId).ItemCount
}
$Avg= $TotalItems / $Users.Count
Write-Host ('Avg. Itemcount: {0}' -f $Avg)
