$out_dir = $args[0]
$json_name = "io.github.richardchien.coolqhttpapi.json"
$json_path = "${out_dir}\${json_name}"

$content = Get-Content "$PSScriptRoot\..\${json_name}" -Encoding UTF8 -Raw
$gb18030 = [System.Text.Encoding]::GetEncoding("GB18030")
$gb18030.GetBytes($content) | Set-Content $json_path -Encoding Byte

if ([System.IO.File]::Exists("$PSScriptRoot\install.ps1")) {
    powershell.exe -ExecutionPolicy Bypass -NoProfile -File "$PSScriptRoot\install.ps1" $args
}
