#!/usr/bin/env python3 -tt
import subprocess

def main():
    print("\n\n        I came here to drink milk and kick ass, and I've just finished my milk.\n                                                        - Word (Moss), 2010\n")
    subprocess.Popen(["sudo" "pg_ctlcluster" "12" "main" "start"], stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()
    subprocess.Popen(["cuckoo" "web" "runserver"], stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()

if __name__ == "__main__":
    main()