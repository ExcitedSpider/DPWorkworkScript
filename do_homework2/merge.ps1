
param($pattern,$outname)

$json = @{}
Get-ChildItem -Recurse $pattern | ForEach-Object {
  $_.FullName | Write-Host -ForegroundColor Yellow
  $one = get-content ($_.FullName) -Encoding UTF8 | ConvertFrom-Json
  $json.sentences += $one.sentences
}

$json.sentences = $json.sentences | Sort-Object -Property @{Expression = "video_id";Ascending=$true},@{Expression="sen_id";Ascending=$true} 

$json | ConvertTo-Json | Out-File $outname

