Function Test {
    For( $i=0; $i -lt 4; $i++) {
        Write-Host ('Start {0}' -f $i)
        If( $i -eq 2) {

            # Aborts the loop
            #Break

            # Skips iteration, continues with next iteration
            #Continue

            # Aborts execution, continues at caller scope 
            #Return

            # Exits and at scope of caller 
            Exit
        }
        Write-Host ('End {0}' -f $i)
    }
    Write-Host ('End Function.')
}

Test
Write-Host ('End Script.')
