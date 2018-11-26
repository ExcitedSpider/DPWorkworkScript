

function mergeOneJson {
    param (
        $namereg,
        $outname
    )
    $jsoninfo = Get-Content .\info.json | ConvertFrom-Json
    $json = @{}
    $json.info = $jsoninfo
    Get-ChildItem -Recurse $namereg | foreach {
        "find file: {0}" -f ($_.FullName)
        $one = Get-Content $_.FullName -Encoding utf8 | ConvertFrom-Json
        $json.videos += $one.videos;
        $json.sentences += $one.sentences;
        "the count of json sentences:{0}" -f ($json.videos.Count)
    }
     for ($i = 0; $i -lt $json.videos.Count; $i++) {
         $json.videos[$i].id = $i
     }
     for ($i = 0; $i -lt $json.sentences.Count; $i++) {
         $json.sentences[$i].sen_id = $i
    }
    $json | ConvertTo-Json | Out-File $outname
}

"process en json" | Write-Host -ForegroundColor Yellow
mergeOneJson *en*json* .\1.json
"process zh json" | Write-Host -ForegroundColor Yellow
mergeOneJson *zh*json* .\2.json