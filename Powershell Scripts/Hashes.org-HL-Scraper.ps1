 $A = 14 .. 1150
 $i = 14
foreach( $i in $A) {
    Invoke-WebRequest -Uri "https://hashes.org/download.php?type=hfound&hashlistId=$i" -Headers @{"Referer"="https://hashes.org/"} -O "D:\hashes.org leaks\$i.txt";
    
       $i++
        }
