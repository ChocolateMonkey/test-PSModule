
$installDir = (Split-Path $MyInvocation.MyCommand.Path -Parent)

$dir1 = (Get-Item $installDir)

$dir2 = $dir1.Parent

$matches = Get-Item $dir1\* | Where {$_.Name -like "*$($dir1.Name)*" } | Select Name 

if($matches.Count -eq 0)
{
    "your directory is not named the same as your psd1, I think you will have problems unless you change that"
    exit 1
}

if($dir2 -is [System.IO.DirectoryInfo])
{
    if(!($env:PSModulePath -like "*$($dir2.FullName)*"))
    {
        Add-Content $Profile "`$env:PSModulePath += `";$($dir2.FullName)`"" 
    }
    else
    {
        "you've already got it mapped!"
        cat $profile
    }
}
else
{
    "Not sure you have the right directory structure, I would advise creating an area for your psmodules to exist and then a sub directory for each psd1 with a matching name"
}


