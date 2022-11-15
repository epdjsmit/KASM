#!/usr/bin/env python3 -tt

def main():
    content = "# set environment variables\nexport PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/opt/elrond\n\n#set background\ngsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/kasm.png\n\n#set terminal preferences\n/usr/bin/./theme.sh dracula\nPS1='\\[\\033[01;32m\\]\\u@\\h\\[\\033[01;37m\\]:\\[\\033[01;33m\\]\w\\n\\[\\033[01;37m\\]$ '\n\n# set icons\ngsettings set org.gnome.shell favorite-apps \"$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'org.gnome.seahorse.Application.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Screenshot.desktop', 'firefox.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'bless.desktop', 'wireshark.desktop', 'networkminer.desktop', 'cyberchef.desktop', 'die.desktop', 'jd-gui.desktop', 'ghidra.desktop', 'cutter.desktop', 'gnome-control-center.desktop']\"\n"
    with open("/home/ninja/.bashrc", "w") as bashrc:
        bashrc.write(content)

if __name__ == "__main__":
    main()