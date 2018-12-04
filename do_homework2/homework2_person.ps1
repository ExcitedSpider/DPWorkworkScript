
param(
    [Parameter(Mandatory="true")]
    [int]$sen_id,
    [Parameter(Mandatory="true")]
    [string]$filepath,
    [Parameter(Mandatory="true")]
    [string]$outfile
)


$json=@{}
$json.sentences=@()

Get-Content $filepath -Encoding UTF8 | ConvertFrom-Csv | ForEach-Object {
    $item=@{}
    $item.caption=$_.caption
    $item.video_id="video_{0}" -f ($_.video_id)
    $item.sen_id=$sen_id
    $json.sentences+=$item
}

$json | ConvertTo-Json | Out-File $outfile -Encoding utf8