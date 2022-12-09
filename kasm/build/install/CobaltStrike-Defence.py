#!/usr/bin/env python3 -tt
import subprocess

def main():
    with open("/home/ninja/Desktop/CobaltStrike-Defence/README.md") as readme:
        for eachline in readme:
            slashes = eachline.count('/')
            if slashes == 4 and "https://github.com/" in eachline:
                repo = eachline.strip().split("/")[-1]
                subprocess.Popen(["sudo", "git", "clone", eachline.strip(), "/home/ninja/Desktop/CobaltStrike-Defence/content/{}".format(repo)])
            elif "http":
                with open("/home/ninja/Desktop/CobaltStrike-Defence-Resources.txt", "w") as resources:
                    resources.write(eachline)

if __name__ == "__main__":
    main()