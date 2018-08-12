#Written by PurpleNinja225
#This script is used to search a directory for cap files, convert them to hccapx format then merge the caps into one file that can be used by Hashcat.
#This script *does not clean up cap files* it will only append one to the end of another.

$files = Get-ChildItem -name new_caps

foreach ($file in $files){
    $file2 = $file
    .\cap2hccapx.exe new_caps\$file new_hccapxs\$file2.hccapx
    }

echo "Done converting. Now merging hccapx files together"
Start-Sleep 1

gc -encoding Byte -path new_hccapxs\*.hccapx | sc -Encoding Byte multi_hccapxs\multi.hccapx
