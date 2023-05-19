<# idea : rxclip
cmdlet: copy-regexmatch
alias; rxclip

take as pipeline input, some wad of text.
Take as paramater input a regex pattern to match.

result will ouput only the piped in text that matches the regex pattern, like a grep and cut , to both the console and the clipboard.
#>

param (
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    $InputText,
    
    [Parameter(Mandatory = $true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    $RegexPattern
)

# Create a StringBuilder object to store the matching text
$outputBuilder = New-Object System.Text.StringBuilder

# Process each line of input text
$InputText -split "`n" | ForEach-Object {
    $line = $_
    # Check if the line matches the regex pattern
    if ($line -match $RegexPattern) {
        # Append the matching line to the output StringBuilder
        $outputBuilder.AppendLine($line)
    }
}

# Output the matching text to the console
Write-Host $outputBuilder.ToString() -ForegroundColor Green

# Copy the matching text to the clipboard
$outputBuilder.ToString() | clip
