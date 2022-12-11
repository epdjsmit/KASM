<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://github.com/ezaspy/KASM">
    <img src="./kasm/images/kasm-logo-color.png" alt="Logo" width="600" height="280">
  </a>
  <br><br>
  <p align="center">
    Collation of security toolsets, frameworks and projects to assist folks during Digital Forensics/Incident Response (DFIR) investigations, Threat Hunting, Malware Analysis and OSINT Gathering
    <br><br>
    <a href="https://mit-license.org">
      <img src="https://img.shields.io/github/license/ezaspy/KASM" alt="License: MIT">
    </a>
    <a href="https://github.com/ezaspy/KASM/issues">
      <img src="https://img.shields.io/github/issues/ezaspy/KASM" alt="Issues">
    </a>
    <a href="https://github.com/ezaspy/KASM/network/members">
      <img src="https://img.shields.io/github/forks/ezaspy/KASM" alt="Forks">
    <a href="https://github.com/ezaspy/KASM/stargazers">
      <img src="https://img.shields.io/github/stars/ezaspy/KASM" alt="Stars">
    </a>
    </a>
      <img src="https://img.shields.io/github/last-commit/ezaspy/KASM" alt="Last Commit">
    </a>
    <a href="https://github.com/psf/black">
      <img alt="Code style: black" src="https://img.shields.io/badge/code%20style-black-000000.svg">
    </a>
    <br><br>
  </p>
</p>

<!-- TABLE OF CONTENTS -->

# Table of Contents

- [About](#about)
  - [Related Projects](#related-projects)
- [Usage](#usage)
- [Configuration](#configuration)
  - [KASM Virtual Machine](#kasm-virtual-machine)
  - [KASM Configuration Script](https://github.com/ezaspy/elrond/blob/main/elrond/BUILD.md)
- [Acknowledgements](#acknowledgements)

<br><br>

<!-- ABOUT -->

# About

Kick-Ass Security Machine (KASM) has been primarily created as an all-in-one Digital Forensics/Incident Response, Threat Hunting (DFIR-TH) pre-packaged virtual machine. KASM is full of invaluable forensics, malware analysis, threat intelligence and security analytics tools to aid, assist and automate with conducting Digital Forensics/Incident Response (DFIR) and Threat Hunting. The main reason for creating this VM is that when I have encountered environments where regular access to the Internet is extremely limited making the installation of additional software very difficult.<br>
KASM should have everything you need whilst alleviating the reliance on having to install additional software. As new software and toolsets get released and reviewed, they will be added to the VM and relevant scripts.<br>All of the included toolsets and software are referenced in [Acknowledgements](#acknowledgements).<br>

### Related Projects

A lot of the scripts and software installed in KASM has come from developing [elrond](https://github.com/ezaspy/elrond). 
<br><br><br>

<!-- PREREQUISITES -->

# Usage

`sudo /home/ninja/Desktop/./kick-ass.sh`<br>

<table border:transparent cellspacing="0" cellpadding="0">
  <tr>
      <td><h2><b>Tool</b></h2></td>
      <td><h2><b>Port</b></h2></td>
      <td><h2><b>Credentials</b></h2></td>
  </tr>
  <tr>
      <td>Greenbone</td>
      <td>127.0.0.1:9392</td>
      <td>admin::admin</td>
  </tr>
  <tr>
      <td>TheHive</td>
      <td>127.0.0.1:9000</td>
      <td>admin@thehive.local::secret</td>
  </tr>
  <tr>
      <td>MISP</td>
      <td>127.0.0.1:443</td>
      <td>admin@admin.test::admin</td>
  </tr>
  <tr>
      <td>Splunk</td>
      <td>127.0.0.1:8000</td>
      <td>admin::kick-ass</td>
  </tr>
  <tr>
      <td>Kibana</td>
      <td>127.0.0.1:9201</td>
      <td>-</td>
  </tr>
  <tr>
      <td>Navigator</td>
      <td>127.0.0.1/attack-navigator</td>
      <td>-</td>
  </tr>
  <tr>
      <td>Cuckoo</td>
      <td>127.0.0.1:8080</td>
      <td>-</td>
  </tr>
</table>
<br><br>

<!-- PREREQUISITES -->

# Configuration

## KASM Virtual Machine

**Recommended Method**<br>
Download the [KASM Virtual Machine](https://drive.google.com/file/d/1BjL3DUoE2-V7AwXCUFhmHuwQoThd48l_/view?usp=sharing) OVA, which is the latest version of SIFT (20.04) with additional software packages, pre-installed.
> __Note__ - Last Updated: **DEC-2022**<br>

## KASM Configuration Script
Follow the instructions in [BUILD.md](https://github.com/ezaspy/KASM/blob/main/kasm/BUILD.md).&nbsp;&nbsp;**_Please read the instructions carefully._**
> __Note__ - Last Updated: **DEC-2022**<br>

<br><br>

<!-- ACKNOWLEDGEMENTS -->

# Acknowledgements

- [Desktop Background](https://www.canva.com/design/DAFQt9mHyiQ/sj_cMIlhHUAbQPiyLYR5TA/edit?utm_source=onboarding#)
- [Logo](https://app.logo.com/dashboard/logo_e2285b91-8ee8-4900-a40a-96da8d0ded1e/your-logo-files)
- [SIFT](https://www.sans.org/tools/sift-workstation/)
- [bruce](https://github.com/ezaspy/bruce.git)
- [gandalf](https://github.com/ezaspy/gandalf.git)
- [elrond](https://github.com/ezaspy/elrond.git)
- [VMware](https://www.vmware.com/uk/products/workstation-player.html)
- [VirtualBox](https://www.virtualbox.org)
- [nmap](https://nmap.org)
- [Visual Studio Code](https://code.visualstudio.com)
- [Greenbone](https://www.greenbone.net/en/)
- [MISP](https://www.misp-project.org)
- [TheHive](https://thehive-project.org)
- [REMnux](https://docs.remnux.org)
- [Cuckoo](https://cuckoosandbox.org)
- [jupyter](https://jupyter.org)
- [Bookstack](https://github.com/BookStackApp/BookStack.git)
- [TZWorks](https://tzworks.com/)
- [BlueTeamPowerShell](https://blueteampowershell.com)
- [Registry Viewer](https://accessdata.com/product-download/registry-viewer-2-0-0)
- [SIGMA](https://github.com/SigmaHQ/sigma.git)
- [DeepBlueCLI](https://github.com/sans-blue-team/DeepBlueCLI.git)
- [KAPE](https://github.com/EricZimmerman/KapeFiles.git)
- [PowerForensics](https://github.com/Invoke-IR/PowerForensics.git)
- [MemProcFS](https://github.com/ufrisk/MemProcFS.git)
- [Sysmon](https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon)
- [WMIExplorer](https://github.com/vinaypamnani/wmie2/)
- [CobaltStrike-Defence](https://github.com/MichaelKoczwara/Awesome-CobaltStrike-Defence)
- [Metasploit](https://www.metasploit.com)
- [HTTrack](https://github.com/xroche/httrack.git)
- [Maltego](https://www.maltego.com)
- [freq](https://github.com/MarkBaggett/freq.git)
- [dnstwist](https://github.com/elceef/dnstwist.git)
- [rdap](https://github.com/ezaspy/rdap.git)
- [sherlock](https://github.com/sherlock-project/sherlock.git)
- [TweetScraper](https://github.com/jonbakerfish/TweetScraper.git)
- [karma](https://github.com/Dheerajmadhukar/karma_v2.git)
- [oscybershop](https://oscybershop.herokuapp.com/main/index.html)
<br><br>
