## **PurpleNinja's Top Masks**

In my quest to have more efficient masks for hashcat I began my search like any other; google. My searches didn’t yield much (maybe because I’m not quite yet a google jedi) I was able to find some security blogs that listed the poster’s favored masks, but nothing with enough data to back up why I should be using them. The closest was _NSAKEY’s [nsa-rules](https://github.com/NSAKEY/nsa-rules) repo on github, but they were generated using PACK. I was unfamiliar with the tool so I didn’t want to use it because I don’t know how it decides to generate its masks. I wanted most common masks, built from real passwords. So I decided to make my own.

### **Getting Started**

I started with compiling a list of leaked passwords and [Hashes.org](https://hashes.org/leaks.php) was very kind to give me what I needed. I downloaded some of the largest database leaks it had to offer and combined them together. 

#### **Databse leaks used**

- last.fm 2016
- zoosk.com
- id.zing.vn
- imesh
- youku
- badoo
- linkedin
- xsplit
- ownedcore.com
- mac-torrents.com
- taringa.net
- gamigo
- haveibeenpwnedv2
- haveibeenpwnedv3v2excluded
- dropbox
- time warner cable business class
- furaffinity.net
- gamephics.com
- cheapassgamer.com
- solomid.net
- hackbase.cc
- newseasims.com (2018)


Once combined I had 868,763,973 passwords and next I needed to turn each password into a mask of itself, like turning Password123! into “alllllllddds” with s=Symbol, d=Digit, a=Alpha, l=Lower-Alpha. 

For this I used the Unified List Manager aka "ULM" because it had a handy option to do exactly what I needed. After I had everything masked it was just a simple command to get a frequency list out of them.
'''
sort GroupMaskFreq.txt | uniq -c | sort -n -r > maskfreq.txt
'''
This was quite the waiting game. Almost 3 hours to complete, but what I was left with was a wonderful list of masks and how many times each one had occurred. 

Top 20 contains masks with 10 million+ hits.
Top 100 actually contains 96 masks, all of which had over 1 million hits.
Top 570 contains masks with over 100 thousand hits.

