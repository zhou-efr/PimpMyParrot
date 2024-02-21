# Pimp My Parrot (WIP)
Petit script pour installer rapidement quelques outils sur Parrot OS.
Inspiré par [Dewalt-arch](https://github.com/Dewalt-arch/pimpmykali.git) trouvé dans le cours PEH de Heath Adams.

```bash
wget -qO- https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/PimpMyParrot.sh | bash
```

or minimalist version for fast download (no AD setup)

```bash
wget -qO- https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/MinimalistPimp.sh | bash
```

## Content
Certainly! Below is a categorized list of the installations and tools based on their primary use and function:

---

### **System Maintenance and Utilities:**
- **System Update:** Updates and upgrades system packages.
- **Tilix:** A tiling terminal emulator.
- **Gogh:** A terminal color scheme manager.
  
### **Network and Security Tools:**
- **OpenVPN:** For establishing secure connections.
- **Exploit-DB:** A database of known vulnerabilities.
- **Searchsploit:** A tool for searching the Exploit-DB.
- **dirsearch:** A simple command-line tool designed to brute force directories and files in websites.
- **WPScan:** Black box WordPress vulnerability scanner.
- **ffuf (Fuzz Faster U Fool):** A fast web fuzzer.
- **subfinder:** A subdomain discovery tool.
- **Impacket:** A collection of Python classes for working with network protocols.
- **mitm6:** IPv6 man-in-the-middle tool.
- **nfs-common:** NFS (Network File System) client utilities.
- **Feroxbuster:** A fast, simple, recursive content discovery tool.
- **OpenVPN:** For VPN connections.
- **CrackMapExec:** A post-exploitation tool to help automate assessing the security of large Active Directory networks.
- **Shellter:** A dynamic shellcode injection tool.
- **Veil:** A tool designed to generate metasploit payloads that bypass common anti-virus solutions.
- **evil-winrm:** The ultimate WinRM shell for hacking/pentesting.
- **Veil:** A tool for generating antivirus-evading payloads.
- **Shelter:** An antivirus evasion tool.

### **Database Tools:**
- **MariaDB:** A popular open-source relational database.
- **mssql-cli:** A command-line interface for managing Microsoft SQL Server.

### **User Environment and Configuration:**
- **ZSH and Oh My ZSH:** Extended Bourne Shell with a large number of improvements, including some features of Bash, ksh, and tcsh.
- **nvim (Neovim):** A refactor of Vim aiming to improve the extensibility and maintainability of Vim.
- **Gogh:** Terminal color scheme manager.
- **xfreerdp:** A free implementation of the Remote Desktop Protocol (RDP). (manually installed with aptitude)
  
### **File Transfer and Web Server Tools:**
- **WSGI:** A specification that describes how a web server communicates with web applications.
- **Filezilla:** An FTP, FTPS, and SFTP client.

### **Development and Scripting:**
- **pip and pipx:** Python package managers.
- **rlwrap:** A 'readline wrapper' that uses the GNU readline library to allow the editing of keyboard input for any command.
- **python2 and python3:** Popular high-level scripting languages.
- **Postman:** A platform for API development.

### **Miscellaneous Tools and Utilities:**
- **SNMP tools (snmpd and snmp):** For monitoring networked devices.
