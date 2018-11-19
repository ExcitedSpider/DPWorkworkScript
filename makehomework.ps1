
param($csv, $video, $beginid)

function cut_video {

    param($source, $start, $duration, $outid)

    ffmpeg -i $source -ss $start -t $duration -c:a copy ('outfile\temp4_'+$outid+'.avi')
    ffmpeg -i ('outfile\temp4_'+$outid+'.avi') -vn -y -ar 44100 -acodec copy ('outfile\soud4_'+$outid+'.aac')
}

$infos = Import-Csv $csv

mkdir outfile
for($i=0;$i -lt $infos.Count;$i++){
    "start process with id $i `n"| Write-Host -ForegroundColor Yellow
    'cut origin video' | Write-Host -ForegroundColor Yellow
    cut_video -source $video -start ($infos[$i].start) -duration ($infos[$i].duration) -outid (($i+$beginid)) 
    'use opencv in python' | Write-Host -ForegroundColor Yellow
    python .\separation.py $i 
    del ('outfile\temp4_'+$i+'.avi')
    "done with id $i `n`n" | Write-Host -ForegroundColor Yellow
}
