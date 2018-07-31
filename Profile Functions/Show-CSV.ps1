function Show-CSV ()
{
    Get-ChildItem | ? Name -Like "*.CSV" 
}
