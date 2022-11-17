# Building KASM

## _Virtual Machine Settings_
Download and import [SANS SIFT Worksation](https://www.sans.org/tools/sift-workstation/) (adjust settings such as RAM if desired)<br>

#### **Menu Bar -> Virtual Machine -> Settings... ->**

- **Network Adaptor -> NAT/Bridged**<br>

#### **Menu Bar -> Virtual Machine -> Settings... ->**
 - Add Device...
   - New Hard Disk...
     - Add...
       - **File name: `Virtual Disk 2.vmdk`**
       - **Disk Size: `20.00GB` (more, if desired)**
       - **Advanced options: `None`**
       - **Apply**
- Start SIFT<br>

---
## _Initialisation_
_Note, the following script will partition and format /dev/sdb. If you have not configured the second HDD as recommended above, it may delete data if you have another drive mounted. You can change this location, by editing the [elrond init.sh](https://github.com/ezaspy/elrond/blob/main/elrond/tools/config/scripts/init.sh) script_<br><br>
The virtual machine will reboot and/or log out automatically, the lines below indicate when this will occur during the script execution.<br>
The installation can take serveral hours. When prompted, enter the necessary credentials and/or the following commands (may need to use TAB to change options):<br><br>
```
sudo git clone https://github.com/ezaspy/KASM.git /opt/kasm && /opt/kasm/./make.sh
```
### _elrond_
 - **&darr; &darr; ENTER c g**<br>

Created **_temp_** account<br>
&nbsp;&nbsp;&nbsp;&nbsp;Enter **_temp_** account password<br>
&nbsp;&nbsp;&nbsp;&nbsp;Confirm **_temp_** account password<br>

---

Enter **_temp_** account password<br>
&nbsp;&nbsp;&nbsp;&nbsp;Enter **_ninja_** account password<br>
&nbsp;&nbsp;&nbsp;&nbsp;Confirm **_ninja_** account password<br>

---
## _Installation_
Log into _ninja_ account<br>
Enter **_ninja_** account password<br>
### _Greenbone_
 - Configure smb.conf automatically?<br>
   - **&lt;Yes&gt;**<br>
### _MISP_
Enter **_misp_** account password<br>
 - Configure smb.conf automatically?<br>
   - **&lt;Yes&gt;**<br>
 - What do you want to do about modified configuration file smb.conf?<br>
   - **install the package maintainer's version**<br>
### _TheHive_
 - 
### _Cuckoo_
 - 
### _BlueTeamPowerShell_
 - LAPTOP-SETUP-README-NOW.txt password:
   - **505**
<br>

---
<h2 align="center">⚠️ Take Snapshot ⚠️</h2>

---
<br><br>

# Configuring KASM

## _Configuration_
### _MISP_
 - 
### _Cuckoo_
 - 
### _TheHive_
 - 
### _Metasploit_
 - 
<br>

---
<h2 align="center">⚠️ Take Snapshot ⚠️</h2>

---
<br><br>

# _Reverting Virtual Machine_

#### **Menu Bar -> Virtual Machine -> Settings... ->**

- **Network Adaptor -> Custom (Private)**<br>

---

_If you experience any issues, please try building a new KASM Virtual Machine and then raise an issue inline with the instructions in the [README.md](https://github.com/ezaspy/KASM/blob/main/kasm/README.md)_<br>