
#This script is inteded to utilize the App.Merge program created by BlandyUK from the hashkiller.co.uk forums.
#Script simply splits the host wordlist into 128 files sorted by length. AKA: all passwords that have a length
#of 8 will all be in the 8.txt file and all passwords Len:10 will be in the 10.txt file.

$number = 1

while($number -le 128){
    .\App.Merge.exe "o=GrandMasterListL$number.txt" t=4 c=3072 min=$number max=$number .\GrandMasterList.txt

    sleep 5
    
    $number++
}

if($number == 128){
    .\App.Merge.exe "o=GrandMasterListL$number.txt" t=4 c=3072 min=$number .\GrandMasterList.txt
    # Any 
