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
  - [KASM-Workstation Virtual Machine](#kasm-workstation-virtual-machine)
  - [KASM-Workstation Configuration Script](https://github.com/ezaspy/elrond/blob/main/elrond/BUILD.md)
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
      <td><b>KASM-Workstation</b></td>
      <td>-</td>
      <td><b>ninja::kasm</b></td>
  </tr>
  <tr>
      <td>--------------------</td>
      <td>--------------------</td>
      <td>--------------------</td>
  </tr>
  <tr>
      <td><b>Greenbone</b></td>
      <td><b>127.0.0.1:9392</b></td>
      <td><b>admin::admin</b></td>
  </tr>
  <tr>
      <td><b>TheHive</b></td>
      <td><b>127.0.0.1:9000</b></td>
      <td><b>admin@thehive.local::secret</b></td>
  </tr>
  <tr>
      <td><b>MISP</b></td>
      <td><b>127.0.0.1:443</b></td>
      <td><b>admin@admin.test::admin</b></td>
  </tr>
  <tr>
      <td><b>Splunk</b></td>
      <td><b>127.0.0.1:8000</b></td>
      <td><b>admin::kick-ass</b></td>
  </tr>
  <tr>
      <td><b>Kibana</b></td>
      <td><b>127.0.0.1:9201</b></td>
      <td><b>-</b></td>
  </tr>
  <tr>
      <td><b>Navigator</b></td>
      <td><b>127.0.0.1/attack-navigator</b></td>
      <td>-</td>
  </tr>
  <tr>
      <td><b>Cuckoo</b></td>
      <td><b>127.0.0.1:8080</b></td>
      <td>-</td>
  </tr>
  <tr>
      <td>--------------------</td>
      <td>--------------------</td>
      <td>--------------------</td>
  </tr>
  <tr>
      <td>postgresql</td>
      <td>-</td>
      <td>::kasm</td>
  </tr>
</table>
<br><br>

<!-- PREREQUISITES -->

# Configuration

## KASM-Workstation Virtual Machine

**Recommended Method**<br>
Download the [KASM-Workstation Virtual Machine OVA](https://onedrive.live.com/download?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213092905&authkey=APqcjtnndcHyTVM), which is the latest version of SIFT (20.04) with additional software packages, pre-installed.
> __Note__ - Last Updated: **DEC-2022**<br>

## KASM-Workstation Configuration Script
Follow the instructions in [BUILD.md](https://github.com/ezaspy/KASM/blob/main/kasm/BUILD.md).&nbsp;&nbsp;**_Please read the instructions carefully._**
> __Note__ - Last Updated: **DEC-2022**<br>

<br><br>

<!-- ACKNOWLEDGEMENTS -->

# Acknowledgements
- Design
  - [Desktop Background](https://www.canva.com/design/DAFQt9mHyiQ/sj_cMIlhHUAbQPiyLYR5TA/edit?utm_source=onboarding#)
  - [Logo](https://app.logo.com/dashboard/logo_e2285b91-8ee8-4900-a40a-96da8d0ded1e/your-logo-files)
  - [ASCII Art](https://www.messletters.com/en/big-text/)
<br><br>

- Tooling
  - Installed
    - [SIFT](https://www.sans.org/tools/sift-workstation/)
    - [REMnux](https://docs.remnux.org)
    - [Cuckoo](https://cuckoosandbox.org)
    - [TheHive](https://thehive-project.org)
    - [MISP](https://www.misp-project.org)
    - [Greenbone](https://www.greenbone.net/en/)
    - [VMware](https://www.vmware.com/uk/products/workstation-player.html)
    - [Visual Studio Code](https://code.visualstudio.com)
    - [elrond](https://github.com/ezaspy/elrond.git)
    - [Jupyter Notebooks](https://jupyter.org)
    - [Chrome](https://www.google.com/intl/en_uk/chrome/)
    - [Firefox](https://www.mozilla.org/en-GB/firefox/new/)
    - [DB Browser for SQLite](https://sqlitebrowser.org)
    - [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
    - [AWS CLI](https://aws.amazon.com/cli/)
    - [gcloud CLI](https://cloud.google.com/sdk/gcloud)
    - [Bookstack](https://github.com/BookStackApp/BookStack.git)
    - [Metasploit](https://www.metasploit.com)
    - [HTTrack](https://github.com/xroche/httrack.git)
    - [Maltego](https://www.maltego.com)<br><br>

  - Downloaded
    - [oscybershop](https://oscybershop.herokuapp.com/main/index.html)
    - [gandalf](https://github.com/ezaspy/gandalf.git)
    - [bruce](https://github.com/ezaspy/bruce.git)
    - [SIGMA](https://github.com/SigmaHQ/sigma.git)
    - [DeepBlueCLI](https://github.com/sans-blue-team/DeepBlueCLI.git)
    - [KAPE](https://github.com/EricZimmerman/KapeFiles.git)
    - [PowerForensics](https://github.com/Invoke-IR/PowerForensics.git)
    - [MemProcFS](https://github.com/ufrisk/MemProcFS.git)
    - [WMIExplorer](https://github.com/vinaypamnani/wmie2/)
    - [CobaltStrike-Defence](https://github.com/MichaelKoczwara/Awesome-CobaltStrike-Defence)
    - [freq](https://github.com/MarkBaggett/freq.git)
    - [dnstwist](https://github.com/elceef/dnstwist.git)
    - [rdap](https://github.com/ezaspy/rdap.git)
    - [sherlock](https://github.com/sherlock-project/sherlock.git)
    - [TweetScraper](https://github.com/jonbakerfish/TweetScraper.git)
    - [karma](https://github.com/Dheerajmadhukar/karma_v2.git)
    - [TZWorks](https://tzworks.com/)
    - [BlueTeamPowerShell](https://blueteampowershell.com)
    - [Sysmon](https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon)
<br><br>
