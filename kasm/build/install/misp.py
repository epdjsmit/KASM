#!/usr/bin/env python3 -tt
import os

def main():
    if os.path.exists("/tmp/INSTALL.sh"):
        os.remove("/tmp/INSTALL.sh")
    with open("/tmp/INSTALL_orig.sh") as orig:
        with open("/tmp/INSTALL.sh", "a") as install:
            for eachline in orig:
                if "echo" in eachline and "##" not in eachline and "tee" not in eachline and ("Password:" in eachline or "User:" in eachline):
                    install.write("{} | tee /home/misp/misp.txt\n".format(eachline[0:-1]))
                elif '  if [[ "${chsum}" == "${INSTsum}" ]]; then' in eachline:
                    install.write("{}\n".format(eachline[0:-1].replace(" == ", " != ")))
                elif 'echo "sha${sum} matches"' in eachline:
                    install.write("{}\n".format(eachline[0:-1].replace("sha${{sum}} matches", "")))
                else:
                    install.write(eachline)

if __name__ == "__main__":
    main()