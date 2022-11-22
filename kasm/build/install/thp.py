#!/usr/bin/env python3 -tt
import subprocess

def main():
    misp_out = str(subprocess.Popen(["sudo", "-H", "-u", "misp", "bash", "-c", "'bash", "/tmp/INSTALL.sh", "-A'"], stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[0])
    with open("/home/ninja/misp.txt", "w") as mispout:
        mispout.write(misp_out)

if __name__ == "__main__":
    main()