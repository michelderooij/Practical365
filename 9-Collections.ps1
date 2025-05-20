#############################################################
# Arrays
#############################################################
$arr= @('francis', 'philip')
$arr.getType()
$arr[0]
$arr[0] = 'olrik'

# "Add" an element to an array
$arr+= 'nasir'
# Or, $arr= $arr+ 'nasir'

# Alternative way to create an array
$arr1 = 'francis', 'philip'
# But this does not work with single elements. Compare:
$arr2= 'francis'
$arr2.getType()
$arr3= @('francis')
$arr3.getType()

# Another alternative
$arr4= ,'francis'
$arr4.getType()

# Single object results: PS5 vs PS7 behavior
$Mailboxes= Get-ExoMailbox -Filter "userPrincipalName -eq 'fred@contoso.com'"
If( $Mailboxes.Count -eq 1) {
    Write-Host ('We found a match')
}
Else {
    Write-Error ('We did not find a matching mailbox')
}

# Prevent single-object vs array issues by casting [array]
[Array](Get-ExoMailbox -Filter "userPrincipalName -eq 'fred@contoso.com'")

#############################################################
# Hashtable
#############################################################

$htab= @{}
$htab['Philip']='philip@contoso.com'
# Alternative method to set elements
$htab.Add( 'Francis', 'francis@contoso.com')

$htab['Philip']
$htab | measure

$htab= @{
    'Philip'= 'philip@contoso.com'
    'Francis'= 'francis@contoso.com'
    'Olrik'= 'olrik@contoso.com'
}
ForEach( $Elem in $htab.getEnumerator()) {
    Write( 'Key={0}, Value={1}' -f $Elem.Key, $Elem.Value)
}

# Caching information using lookup table
$Lookup= @{}
Function Get-MyUser( $Id) {
  If(-not $Lookup[ $Id]) {
    $Lookup[ $Id]= Get-ExoRecipient -Identity $Id
  }
  $Lookup[ $Id]
}
Get-Group -RecipientTypeDetails MailUniversalDistributionGroup | ForEach-Object {
    $_.Members | ForEach-Object { Get-MyUser -Id $_ }
}

###########################################################
# Ordered
###########################################################

$htabOrdered= [ordered]@{
    'Philip'= 'philip@contoso.com'
    'Francis'= 'francis@contoso.com'
    'Olrik'= 'olrik@contoso.com'
}
$htabOrdered

###########################################################
# System.Collection.Generic.List
###########################################################

# Not recommended: System.Collection.ArrayList

$GL= [System.Collections.Generic.List[object]]::new()
$GL.add( 'One')
$GL.add( 'Two')
$GL.remove( 'One') | Out-Null
$GL.add( 3)
$GL








