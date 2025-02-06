
Function Get-Something {
    [CmdletBinding()]
    param(
        [ValidateSet('User', 'Group')]
        [string]$SetParam,
        [ValidatePattern('^\d{3}-.*$')]
        [string]$PatternParam,
        [ValidateRange(1,10)]
        [int]$RangeParam,
        [ValidateLength(0,10)]
        [string]$LengthParam,
        [ValidateCount(1,2)]
        [string[]]$CountParam,
        [ValidateScript( { Test-Path -Path $_  } )]
        [string]$ScriptParam
    )
}

Function Get-SomethingMore {
    [CmdletBinding()]
    param(
        [Parameter(HelpMessage="Specify 'User' or 'Group'.")]
        [ValidateSet('User', 'Group')]
        [string]$SetParam,

        [Parameter(HelpMessage="Enter a string that matches the pattern '###-...'")]
        [ValidatePattern('^\d{3}-.*$')]
        [string]$PatternParam,

        [Parameter(HelpMessage="Enter an integer between 1 and 10.")]
        [ValidateRange(1,10)]
        [int]$RangeParam,

        [Parameter(HelpMessage="Enter a string with a length between 0 and 10 characters.")]
        [ValidateLength(0,10)]
        [string]$LengthParam,

        [Parameter(HelpMessage="Enter one or two strings.")]
        [ValidateCount(1,2)]
        [string[]]$CountParam,

        [Parameter(HelpMessage="Enter a valid path.")]
        [ValidateScript( { Test-Path -Path $_  -} )]
        [string]$ScriptParam
    )
}
