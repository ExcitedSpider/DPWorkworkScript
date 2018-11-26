

function mergeOneJson {
    param (
        $namereg,
        $outname
    )
    $jsoninfo = Get-Content .\info.json | ConvertFrom-Json
    $json = @{}
    $json.info = $jsoninfo
    Get-ChildItem -Recurse $namereg | foreach {
        $_.FullName
        $one = Get-Content $_.FullName -Encoding utf8 | ConvertFrom-Json
        $json.videos += $one.videos;
        $json.sentences += $one.sentences;
    }
    for ($i = 0; $i -lt $json.videos.Count; $i++) {
        $json.videos[$i].id = $i
    }
    for ($i = 0; $i -lt $json.sentences.Count; $i++) {
        $json.sentences[$i].sen_id = $i
    }
    $json | ConvertTo-Json | Out-File $outname
}


mergeOneJson *en*json* .\1.json
mergeOneJson *zh*json* .\2.json