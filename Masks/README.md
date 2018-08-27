In my quest to have more efficient masks for hashcat I began my search like any other; google. My searches didn’t yield much (maybe because I’m not quite yet a google jedi) I was able to find some security blogs that listed the poster’s favored masks, but nothing with enough data to back up why I should be using them. The closest was _NSAKEY’s nsa-rules repo on github, but they were generated using PACK. I don’t want to dis on PACK, but I’m unfamiliar with the tool so I didn’t want to use it because I don’t know how it decides to generate its masks. I wanted most common masks, built from real passwords. So I decided to make my own.

I started with compiling a list of leaked passwords and Hashes.org was very kind to give me what I needed. I downloaded some of the largest database leaks it had to offer and combined them together. 


Once combined I had a password list of 868,763,973 and next I needed to turn each password into a mask of itself, like turning Password123! into “alllllllddds” with s=Symbol, d=Digit, a=Alpha, l=Lower-Alpha. For this I used the Unified List Manager aka ULM it has a handy option to do exactly what I needed. After I had everything masked it was just a simple command to get a frequency list out of them.
sort GroupMaskFreq.txt | uniq -c | sort -n -r > maskfreq.txt
This was quite the waiting game… Almost 3 hours to complete, but what I was left with was a wonderful list of masks and how many times each one had occurred. 
