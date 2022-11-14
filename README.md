<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://github.com/ezaspy/KASM">
    <img src="./KASM/images/kasm-logo_yellow.png" alt="Logo" width="600" height="250">
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
    <a>
      <img src="https://img.shields.io/badge/subject-DFIR-red" alt="Subject">
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

# Configuration

## KASM Virtual Machine

It is recommended to simply download the [KASM Virtual Machine](https://drive.google.com/file/d/1BjL3DUoE2-V7AwXCUFhmHuwQoThd48l_/view?usp=sharing) OVA, which is the latest version of SIFT (20.04) with additional software packages, pre-installed.<br><br>
If you do wish to build and configure KASM yourself, follow the instructions below...
<br><br>

## KASM Configuration Script
---
<h2 align="center">⚠️ WARNING ⚠️</h2>
<p align="center">You must have a stable and reliable Internet connection during the entirety of running the KASM configuration script.</p>

---
There are several software package required for using elrond but almost all of them are contained within the [SANS SIFT Worksation](https://www.sans.org/tools/sift-workstation/) virtual machine OVA. However, for the software which is not included, I have provided a series of scripts which installs and configures the additional software.<br>
To invoke the scripts, simply follow the instructions in [BUILD.md](https://github.com/ezaspy/KASM/blob/main/KASM/BUILD.md#configuration)

- [SANS SIFT Workstation](https://digital-forensics.sans.org/community/downloads) (20.04)
  - Note: SANS SIFT 18.04 is not supported.
- [BUILD.md](https://github.com/ezaspy/KASM/blob/main/KASM/BUILD.md) to install and configure the additional software for SIFT 20.04.
  - If you encounter errors with [BUILD.md](https://github.com/ezaspy/KASM/blob/main/KASM/BUILD.md), individual scripts for each of the software packages are contained in [.../KASM/scripts/](https://github.com/ezaspy/KASM/tree/main/KASM/scripts/)
<br><br><br>

<!-- ACKNOWLEDGEMENTS -->

# Acknowledgements

- [Desktop Background](https://www.canva.com/design/DAFQt9mHyiQ/sj_cMIlhHUAbQPiyLYR5TA/edit?utm_source=onboarding#)
- [Logo](https://app.logo.com/dashboard/logo_e2285b91-8ee8-4900-a40a-96da8d0ded1e/your-logo-files)
- [SIFT](https://www.sans.org/tools/sift-workstation/)
- [VMware](https://www.vmware.com/uk/products/workstation-player.html)
- [VirtualBox](https://www.virtualbox.org)
- [nmap](https://nmap.org)
- [Visual Studio Code](https://code.visualstudio.com)
- [Greenbone](https://www.greenbone.net/en/)
- [MISP](https://www.misp-project.org)
- [TheHive](https://thehive-project.org)
- [Cuckoo](https://cuckoosandbox.org)
- [REMnux](https://docs.remnux.org)
- [oscybershop](https://oscybershop.herokuapp.com/main/index.html)
<br><br>
