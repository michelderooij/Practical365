$TotalItems= 0
$Users= 0
Get-User -RecipientTypeDetails UserMailbox | ForEach-Object { 
    $TotalItems+= (Get-ExoMailboxStatistics -Identity $_.externalDirectoryObjectId).ItemCount
    $Users++
}
$Avg= $TotalItems / $Users
Write-Host ('Avg. Itemcount: {0}' -f $Avg)
