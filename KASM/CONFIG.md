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
`sudo git clone https://github.com/ezaspy/KASM.git /tmp/KASM`<br>
- When prompted, enter the keys in the following order:
  - **&darr; &darr; ENTER c g**

<br>

### Reverting SIFT Workstation Virtual Machine

#### **Menu Bar -> Virtual Machine -> Settings... ->**

- **Network Adaptor -> Custom (Private)**<br><br>

_If you experience any issues, please try building a new KASM-VM and then raise an issue inline with the instructions in the [README.md](https://github.com/ezaspy/KASM/blob/main/KASM/README.md)_<br>