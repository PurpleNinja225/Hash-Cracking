import sys, os, subprocess
import numpy as np

    
fname = []
rootdir = sys.argv[1]
rootdir2 = rootdir


def split_combos():
    
    with open(rootdir2) as r:
        newferrors = open("combosplit_errors.txt", 'a') 
        for line in r:
            if line.strip():  # weed out empty lines
                try:
                    try:
                        email, pw = line.split(":",1) # even if : in pw: only split at 1st :
                        if email.strip() and pw.strip(): # only if both filled
                            newfemail.write(email + '\n')
                            newfpass.write(pw + '\n')
                        else:
                            raise ValueError("Something is wrong")

                    except Exception as ex:
                        email, pw = line.split(";",1) # even if ; in pw; only split at 1st ;
                        if email.strip() and pw.strip(): # only if both filled
                            newfemail.write(email + '\n')
                            newfpass.write(pw + '\n')
                        else:
                            raise ValueError("Something is wrong")

                except Exception as ex:
                    print("Error: " + rootdir2, line, ex)
                    newferrors.write(line)      # Prints out the line that caused an error.
#############################################################################################



for root, d_names, f_names in os.walk(rootdir):
    for f in f_names:
        fname.append(os.path.join(root, f))



for path in fname:
    if path.endswith(".txt"):
        rootdir2 = path
        newfemail = open(rootdir2 + "[emails].txt", 'w+')  # Opens new outfiles for for the next processed file
        newfpass = open(rootdir2 + "[pass].txt", 'w+')
        split_combos()
