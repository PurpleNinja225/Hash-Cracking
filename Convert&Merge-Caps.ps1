$files = Get-ChildItem -name new_caps

foreach ($file in $files){
    $file2 = $file
    .\cap2hccapx.exe new_caps\$file new_hccapxs\$file2.hccapx
    }

echo "Done converting. Now merging hccapx files together"

Start-Sleep 1

gc -encoding Byte -path new_hccapxs\*.hccapx | sc -Encoding Byte multi_hccapxs\multi.hccapx