# KASM-VM

- Download [KASM](https://drive.google.com/file/d/1BjL3DUoE2-V7AwXCUFhmHuwQoThd48l_/view?usp=sharing) OVA, which is the latest version of KASM with all of the software packages, pre-installed.
- Alternatively, follow the instructions below...
<br><br><br>

# KASM-Script

- Download and import [SANS SIFT Worksation](https://www.sans.org/tools/sift-workstation/) (adjust settings such as RAM if desired)<br>

It is **highly recommended** to configure at least 4GB/4096MB RAM and also add another HDD dedicated for linux-swap.<br>
#### **Menu Bar -> Virtual Machine -> Settings... ->**
  - Add Device...
    - New Hard Disk...
      - Add...
        - File name: `Virtual Disk 2.vmdk`
        - Disk Size: `20.00GB` (more, if desired)
        - Advanced options: `None`
        - Apply
- Start SIFT<br>

_Note, the following script will partition and format /dev/sdb. If you have not configured the second HDD as recommended above, it may delete data if you have another drive mounted. You can change this location, by editing the [init.sh](https://github.com/ezaspy/KASM/blob/main/KASM/scripts/init.sh) script_<br><br>
When prompted, enter the following commands (may need to use TAB to change options):

---
## _Initialisation_
```
sudo git clone https://github.com/ezaspy/KASM.git /tmp/KASM && /tmp/KASM/./make.sh
```
  - New password:<br>
    - _< password >_<br>
  - Retype new password:<br>
    - _< password >_<br>

---
### _Account Manipulation_

### _temp account_
  - Log into **_temp_** account<br>
    - Open Terminal<br>
      - `./user.sh`

### _ninja account_
  - Log into **_ninja_** account<br>

---

## _Configuration_
```
sudo git clone https://github.com/ezaspy/KASM.git /tmp/KASM && /tmp/KASM/KASM/./config.sh
```
  - KDE Wallet Service<br>
    - **Cancel**<br>
### _apfs-fuse_
  - **&darr; &darr; ENTER c g**<br>
### _MISP_
  - [sudo] password for misp:<br>
    - _< password >_<br>
  - Configure smb.conf automatically?<br>
    - **&lt;Yes&gt;**<br>
  - What do you want to do about modified configuration file smb.conf?<br>
    - **install the package maintainer's version**<br>
### _Greenbone_
```
sudo useradd -r -M -U -G sudo -s /usr/sbin/nologin gvm && sudo usermod -aG gvm $USER && su $USER
/tmp/KASM/KASM/scripts/software/greenbone/./greenbone.sh
```
 - Errors? Please review [Building 22.4 from Source](https://greenbone.github.io/docs/latest/22.4/source-build/index.html)<br>
```
sudo yarn build
sudo npx browserslist@latest --update-db
```
<br><br>

### Reverting KASM Virtual Machine

#### **Menu Bar -> Virtual Machine -> Settings... ->**

- **Network Adaptor -> Custom (Private)**<br><br>

_If you experience any issues, please try building a new KASM-VM and then raise an issue inline with the instructions in the [README.md](https://github.com/ezaspy/KASM/blob/main/KASM/README.md)_<br>