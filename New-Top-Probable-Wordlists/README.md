
# Purpleninja's New Top Probable wordlists!


I wanted to share my new top probable wordlist, I know that this has been done before, but I feel like I did it a little differently than others. So far, I have only used founds from verified leaks from Hashes.org. I chose Hashes.org because it is an easy place to find as well as it was easy to download the leaks in a hash:salt:plain format which is what I desired. I first started out downloading each individual leak from the site by hand. This proved to be very tedious as there were over 400 leaks to grab. So I set out to create a script to pull them automagically. It was kind of difficult and my first attempts just downloaded all the hashlists instead of just the ones from the leaks list. Luckily, I know Dipeperon, who is pretty good at writing python webscrapers and they kindly wrote one up for me in about an hour. At the time of running the script I downloaded 410 leaks. Which yielded 1,502,957,361 cracked hashes. My first step though was to dedupe the list so I could work with only unique hash:plain combos.

I ran my tests in two different ways first, all the leaks combined and second, just with the salted leaks. I wanted to see how the top lists would differ and by how much. I then broke each test into 3 groups of study; **Password**, **Baseword**, and **Mask research**.

### Password Research
I’ll start with the password research group; for this group I didn’t work the list itself that much, but I did collect some good data and made a couple cool graphs. I started out with 977,690,766 passwords after deduping that I had ripped from their hash counterparts and did a straight frequency analysis right off the bat. Results were typical of what one would expect from doing a frequency sort (freqsort) on a huge list like this. Top passwords like 123456, password, 12345, etc... one that stood out was the password “*homelessPassword*” was in the top 10, this was because of the myspace leak being one of the larger dumps so it may have skewed things a little. This left me with 640,591,921 unique passwords at the end of the day.

Since most of us crack with some application that allows us to add rules I also converted the password list into all lowercase and did another freqsort, this shortened my list down to 611,075,798. I did this because the passwords that were removed because of this can easily be found with common rules like c, u, and toggles. It also gives a slightly more detailed picture into the roots of the passwords people are still using.

The salted only list was significantly smaller coming in at just under 500MB when sorted by frequency. It still tested well, but I will need to start collecting more salted db leaks to give it a true go. The differences I found in the top handful were not as large as I was expecting. If I had done things differently I would have added a 3rd category of making lists out of just the unsalted leaks. The differences in the lists would certainly be greater.

### Baseword Research
Next up is baseword research. This is the real reason I wanted to take on this project, build a lean wordlist of basewords numbers and hex passwords to use with some extensive rule sets to crack as I get slightly better speeds using smaller wordlists with more rules. To get the list ready for baseword extraction I cut out passwords that were only digits and all hex passwords and put them into their own lists respectively. Then I ran get basewords with Unified List Manager (ULM) to trim off extra fat from the passwords. Then I did a freqsort on the resulting list, it ended up with 230,997,631 unique basewords. “*homelessPassword*” was still at the top but I still got a lot of great basewords out. I later gave this list the same treatment as the others and converted all the characters to lowercase and trimmed out any lines that had less than 3 characters as 3 chars didn’t really make good basewords. This grouping gave me 3 wordlists that were all nice and lean basewords was only 2.4GB, Digits at 795MB and Hex passwords only 393MB. I hope to do some more testing with the baseword list and different rulesets to see how they can be best utilized. However, the straight password list sorted by frequency did phenomenal in the initial tests compared to the lists hosted by hashes.org and hashkiller.co.uk. The salted lists were very similar to the combined lists with some mild variance.

### Mask Research
Masks were simple, convert each password into a mask then do a freqsort to see what the top masks were. I’ve done a top masks list before, but it wasn’t quite to this scale or “*quality*”. Before I had chosen 20 or so of the largest dumps I could find. This time I’m using just the leaks, and all of them. The top 10 masks look similar to the ones I got before, but now I have way more data to show true popularity. The top 99 masks all had over 1 million hits and the top 600 have over 100 thousand hits. #1 top mask is, you guessed it, `<?l?l?l?l?l?l?l?l>` [?l(Len:8)] with 157,262,052 matches. I also wondered which masks would be the most common if every password was only allowed one occurrence. I figured this would change things up a bit because candidates like “123456” and “Password” would only show up once.

  ![wl founds table] (https://imgur.com/y6l7ApZ)

I ran the “*All Leaks Merged*” (ALM) and the “*All Salted Leaks Merged*” (ASLM) lists against some “*test*” hashlists from hashkillers.co.uk in a thread that was meant to test wordlist efficiency. I wanted to see how my new lists compared to others, so I recorded things that were easy to pull from hashcat like how many total hashes were in each test, percentage cracked, how big each wordlist was, and even calculated out how many tries per crack each wordlist had. On all three tests hashes.org’s public wordlist cracked the most. ALM(freq_sorted) performed similarly in most of the tests because I had gotten the leaks from hashes.org but since I was only using the leaks, my list didn’t contain passwords from other hashlist founds. However, for having 200 million+ less passwords than the hashes.org list I think the new list did well. I was a little disappointed in Top2Billion from Berzerk0 for having the largest wordlist it was outperformed by ones at a fraction of the size. However, these tests were all done as straight attacks, no rules to help. So, I will run each wordlist again using best64 and see how well each one stacks up them, but that’s a future endeavor.

Next is some graphs:

![founds graph] (https://imgur.com/g7kkRkR)

First up is a simplified view of how many founds each list got for each of the three tests. Hashes.org may get the most founds, but hashkiller_passwords only had 44 million lines and still maintained a competitive amount of founds through each test.

![password length graph] (https://imgur.com/UQacGq9)

Next, we have some data analysis of the passwords. This chart and the remaining were taken from all the leaks merged. This one goes over password lengths and how many times they occurred. Top three lengths are 8, 10, and 9 characters. With length 8 in at over 187 million hits.

![90% in 6 lengths] (https://imgur.com/OwX3063)

This graph sorts them into descending order and shows a percentage line that increases as you add the occurrences of each top length. Meaning, Length 8 passwords make up ~30% of the list, add length 10 and we are up to just over 50%. With the top 6 lengths we hit about 80% of all the passwords.

![charset analysis] (https://imgur.com/5vmhb2W)

This last chart goes over the charset for each password and how many times the charset occurred. So, the password “password1” would fall under the LowerNum charset and “Pas$word1” would be in the MixedNumSymb.

##### Special Thanks!
_**Special thanks to hashkiller.co.uk forums for a place to bounce ideas, s3inlc for hashes.org and letting me download all those leaks!, vetronexe for doing some of the wordlist tests when my desktop was having issues, Dipeperon for the leak scraper, Mexx666666 and John_Smith for keeping me on track and making sure this gets posted, and anyone else I forgot to mention by name! I hope to have more posts like this in the future.**_
