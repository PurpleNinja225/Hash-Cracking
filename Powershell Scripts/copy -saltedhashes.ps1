Foreach ($line in [System.IO.File]::ReadLines('C:\Users\Desktop\Downloads\hashes.org_salted_left_001_ULM_002.txt'))
    {
    copy-item "F:\Original dumps (untouched)\$line* .txt" -Destination "F:\salted dumps\"


    }