# Building KASM

## _Virtual Machine Settings_
Download and import [SANS SIFT Worksation](https://www.sans.org/tools/sift-workstation/)<br>

#### **Menu Bar -> Virtual Machine -> Settings... ->**<br>

- **Processors &amp; Memory -> Memory -> `8192MB`**<br>

- **Network Adaptor -> `NAT/Bridged`**<br>
- **Add Device...**
  - **New Hard Disk...**
    - **Add...**
      - **File name: `Virtual Disk 2.vmdk`**
      - **Disk Size: `20.00GB` (more, if desired)**
      - **Advanced options: `None`**
      - **Apply**
- Start SIFT<br><br>

---
<h2 align="center">⚠️ IMPORTANT ⚠️</h2>
<p align="center">You must have a <b>stable and reliable Internet connection</b> during the entirety of running the KASM configuration script. It is also <b>highly recommended</b>, you reduce network usage whilst KASM is built and configured.</p>

---
## _Installation_
> __Warning__ - _the following script will partition and format /dev/sdb. If you have not configured the second HDD as recommended above, it may delete data if you have another drive mounted. You can change this location, by editing the [elrond init.sh](https://github.com/ezaspy/elrond/blob/main/elrond/tools/config/scripts/init.sh) script_<br>

The virtual machine will reboot and/or log out automatically, the coffee icons below indicate when this will occur during script execution.<br>
The installation can take serveral hours. When prompted, enter the necessary credentials and/or the following commands (may need to use **TAB** to change options; most options are default):<br><br>

## _Configuration_

`sudo git clone https://github.com/ezaspy/KASM.git /opt/kasm && /opt/kasm/./make.sh [-c/--cuckoo] [-g/--greenbone] [-r/--remnux] [-t/--thehiveproject]`<br>
> __Note__ - _the aforementioned flags/switches are optional; providing one or more of them will only install that specified software suite. Anything else provided will install all components of KASM._<br>

 - **&darr; &darr; `ENTER c g`**<br>

> Enter **_temp_** account password<br>
> Confirm **_temp_** account password<br>

<p align="center">☕</p>

> Enter **_temp_** account password<br>

> Enter **_ninja_** account password<br>
> Confirm **_ninja_** account password<br>

<p align="center">☕</p>

> Log into **_ninja_** account<br>

> Enter **_ninja_** account password<br>
 - `Do you want to enable redis unix socket in /etc/redis/redis.conf?`<br>
   - **&lt;`Yes`&gt;**<br>
 - `Configure database for gvmd-pg with dbconfig-common?`<br>
   - **&lt;`Yes`&gt;**<br>
 - `Configuring gvmd-pg`<br>
   - **`localhost`**<br>
   - **&lt;`Ok`&gt;**<br>
 - `PostgreSQL application password for gvmd-pg`<br>
   - **`________`**<br>
 - `Password confirmation`<br>
   - **`________`**<br>
> Enter **_ninja_** account password<br>

> Enter **_misp_** account password<br>
 - `Configure smb.conf automatically?`<br>
   - **&lt;`Yes`&gt;**<br>
 - `What do you want to do about modified configuration file smb.conf?`<br>
   - **`install the package maintainer's version`**<br>

> Enter **_cuckoo_** account password<br>
> Confirm **_cuckoo_** account password<br>

<p align="center">☕</p>

## _Usage_

`sudo /home/ninja/Desktop/./kick-ass.sh`

<br>

---
<br>

# _Reverting Virtual Machine (Optional)_

#### **Menu Bar -> Virtual Machine -> Settings... ->**

- **Network Adaptor -> Custom (Private)**<br>

---

_If you experience any issues, please try building a new KASM Virtual Machine and then raise an issue inline with the instructions in the [README.md](https://github.com/ezaspy/KASM/blob/main/kasm/README.md)_<br>