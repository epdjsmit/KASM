#!/usr/bin/env python3 -tt
import time

def main():
    with open("/tmp/INSTALL_orig.sh") as orig:
        with open("/tmp/INSTALL.sh", "a") as install:
            for eachline in orig:
                if "echo" in eachline and "Password:" in eachline and "PASSWORD_" in eachline and "##" not in eachline:
                    print(eachline)
                    print(eachline[0:-2])
                    time.sleep(10)
                    install.write(eachline)
                else:
                    install.write(eachline)

if __name__ == "__main__":
    main()