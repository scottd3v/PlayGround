function Remove-CSV ()
{
    Get-ChildItem | ? Name -Like "*.CSV" | Remove-Item
}
