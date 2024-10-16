trap [System.Exception] { 
    Write-Error -Message 'An error trapped'
}

ThisCommandDoesNotExit
