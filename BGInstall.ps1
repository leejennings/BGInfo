$url = "https://github.com/leejennings/BGInfo/blob/main/BGInfo.zip"
$outpath = "c:\IT\BGInfo.zip"
$path = "C:\IT"

If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
Invoke-WebRequest -Uri $url -OutFile $outpath

Start-Sleep -Seconds 10

Expand-Archive -LiteralPath $outpath -DestinationPath $path\BGInfo

rmdir $outpath

Start-Process $path\BGInfo\BGInfo.exe $path\BGInfo\config.bgi /timer:0 /silent /nolicprompt /all
