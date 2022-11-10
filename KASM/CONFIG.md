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

_Note, the following script will partition and format /dev/sdb. If you have not configured the second HDD as recommended above, it may delete data if you have another drive mounted. You can change this location, by editing the [elrond init.sh](https://github.com/ezaspy/elrond/blob/main/elrond/tools/config/scripts/init.sh) script_<br><br>
When prompted, enter the following commands (may need to use TAB to change options):

---
## _Initialisation_
```
sudo git clone https://github.com/ezaspy/KASM.git /opt/KASM && /opt/KASM/./make.sh
```
### _elrond_
  - KDE Wallet Service<br>
    - **Cancel**<br>
  - **&darr; &darr; ENTER c g**<br>

#### _temp account_
- New password:<br>
  - _< password >_<br>
- Retype new password:<br>
  - _< password >_<br>

---
#### _ninja account_
  - Log into **_ninja_** account<br>

---

## _Configuration_
```
/opt/KASM/KASM/./config.sh
```
### _Greenbone_
### _MISP_
  - [sudo] password for misp:<br>
    - _< password >_<br>
  - Configure smb.conf automatically?<br>
    - **&lt;Yes&gt;**<br>
  - What do you want to do about modified configuration file smb.conf?<br>
    - **install the package maintainer's version**<br>
### _Cuckoo_
### _TheHive_
<br><br>

### Reverting KASM Virtual Machine

#### **Menu Bar -> Virtual Machine -> Settings... ->**

- **Network Adaptor -> Custom (Private)**<br><br>

_If you experience any issues, please try building a new KASM-VM and then raise an issue inline with the instructions in the [README.md](https://github.com/ezaspy/KASM/blob/main/KASM/README.md)_<br>