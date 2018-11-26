
param ($csv)
function mksen {
    param ($caption, $video_id, $sen_id)

    return @{
    caption=$caption;
    video_id=$video_id;
    sen_id=$sen_id;
    }  
}

$json=@{
    sentences=@()
}
$i=0
Import-Csv $csv | ForEach-Object {$json["sentences"]=$json["sentences"]+((mksen ($_.caption) ($_.video_id) ($_.sen_id))) }
$json | ConvertTo-Json | Set-Clipboard
