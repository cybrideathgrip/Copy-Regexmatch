# Copy-Regexmatch
Powershell Cmdlet to read text from the pipeline and output text matching a regex pattern to the console and clipboard

# Installation  
copy to a local directory. run with powershell

# Use  
Send input via pipeline, however you want. Call the script, and add the regex pattern you want to match as a named, or positional parameter (position 0) 

For best results: Set an alias to C:\path\to\script.ps1  
Example:  
```$msg | rxcopy "\d{7}-\d{6}-\d{5}"```

# Next Steps  
add as a module for easy import. Include alias in the module import.
