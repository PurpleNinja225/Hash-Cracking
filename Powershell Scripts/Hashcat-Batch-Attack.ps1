#Written by PurpleNinja225
#This script assumes you have already split your hashes into multiple files.
 
Param(
    [string]$PathToHashcatExE,     #Path to your hashcat executable.
    [string]$AttackMode = "0",     #Attack mode: Stright, Combination, Brute-force, etc..
    [string]$DeviceType = "2",     #Device used for cracking: CPU, GPU, etc..
    [string]$HashMode,             #Number for your attack mode IE: 0, 100, 3200 (see https://hashcat.net/wiki/doku.php?id=hashcat for list of attack modes)
    [string]$OutFile,              #Location for hashcat to output found hashes and passwords.
    [string]$PathToRules,          #Path to each of your rule files.
    [string]$PathToFolder,         #Path to the folder that contains all of the hashfiles you want to run against.
    [string]$PathToWordlist        #Path to wordlist(s) you want to attack against. Multiple wordlists are supported.
    )

$HashFile = Get-ChildItem -File $PathToFolder

foreach ($File in $HashFile){
    &$PathToHashcatExE --attack-mode $AttackMode --opencl-device-types $DeviceType --hash-type $HashMode --workload-profile 3 --status --status-timer=60 --force --optimized-kernel-enable --remove --separator : --gpu-temp-disable --outfile $OutFile --outfile-format=3 --rules-file $PathToRules $File.FullName $PathToWordList
    }
