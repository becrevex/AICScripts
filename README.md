# AIC Scripts Collection
Operational Security Automation Scripts for a Standard Kali Build

# Installation
Take care of the dependencies:<br>
$ git clone https://github.com/becrevex/AICScripts.git

# Abbreviations

<table class="tg">
<thead>
  <tr>
    <th class="tg-1wig">PREFIX<br></th>
    <th class="tg-1wig">DESCRIPTION<br></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0pky">atk</td>
    <td class="tg-73oq">an active technique performed in an offensive manner</td>
  </tr>
  <tr>
    <td class="tg-0pky">dns</td>
    <td class="tg-0pky">dns related technique or activity</td>
  </tr>
  <tr>
    <td class="tg-0pky">enum</td>
    <td class="tg-0pky">a consolidated group of enumeration techniques performed on a target</td>
  </tr>
  <tr>
    <td class="tg-0pky">file</td>
    <td class="tg-0pky">file related techniques or activities</td>
  </tr>
  <tr>
    <td class="tg-0pky">fw</td>
    <td class="tg-0pky">firewall related techniques or activities</td>
  </tr>
  <tr>
    <td class="tg-0pky">gen</td>
    <td class="tg-0pky">a technique that typically generates a file of some variant</td>
  </tr>
  <tr>
    <td class="tg-0pky">loc</td>
    <td class="tg-0pky">a location technique intended to find a specific file or object</td>
  </tr>
  <tr>
    <td class="tg-0pky">macro</td>
    <td class="tg-0pky">opens a new terminal for all commands executed</td>
  </tr>
  <tr>
    <td class="tg-0pky">mitm<br></td>
    <td class="tg-0pky">a technique used to execute a man-in-the-middle attack</td>
  </tr>
  <tr>
    <td class="tg-0pky">msf</td>
    <td class="tg-0pky">metasploit framework script automation</td>
  </tr>
  <tr>
    <td class="tg-0pky">persist</td>
    <td class="tg-0pky">a script to perform local system persistence techniques</td>
  </tr>
  <tr>
    <td class="tg-0pky">recon<br></td>
    <td class="tg-0pky">recon phase automation scripts</td>
  </tr>
  <tr>
    <td class="tg-0pky">spider</td>
    <td class="tg-0pky">spider automation scripts</td>
  </tr>
</tbody>
</table>

# Current Script Descriptions
<table class="tg">
  <table class="tg">
<thead>
  <tr>
    <th class="tg-1pky">FILENAME<br></th>
    <th class="tg-1pky">DESCRIPTION<br></th>
    <th class="tg-1pky">STATUS<br></th>
  </tr>
</thead>
<thead>
  <tr>
    <th class="tg-0pky">atk_brute_aic.sh</th>
    <th class="tg-0pky">Common brute force script for multiple protocols and services.&nbsp;&nbsp;</th>
    <th class="tg-0pky"></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0pky">atk_ms_aic.sh</td>
    <td class="tg-0pky">Attempts common Windows exploits against the target.</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">atk_smb_vuln.sh</td>
    <td class="tg-0pky">Enumerates SMB low hanging fruit using nmap and NSE</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">dns_aic_recon.sh</td>
    <td class="tg-0pky">(DNS Recon)</td>
    <td class="tg-0pky">Broken</td>
  </tr>
  <tr>
    <td class="tg-0pky">enum_ftp_aic.sh</td>
    <td class="tg-0pky">FTP service enumeration on the provided target system and port specification</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">enum_full_aic.sh</td>
    <td class="tg-0pky">Full NSE enumeration script with a key specification for each service<br></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">enum_http_aic.sh</td>
    <td class="tg-0pky">HTTP service enumeration on the provided target system and port specification</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">enum_mysql_aic.sh</td>
    <td class="tg-0pky">MYSQL service enumeration on the provided target system and port specification<br></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">enum_snmp_aic.sh</td>
    <td class="tg-0pky">SNMP service enumeration on the provided target system and port specification<br></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">enum_ssh_aic.sh</td>
    <td class="tg-0pky">SSH service enumeration on the provided target system and port specification</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">enum_win_aic.sh</td>
    <td class="tg-0pky">Windows system enumeration </td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">file_xfr_aic.sh</td>
    <td class="tg-0pky">Instant local service configuration for file transfer purposes<br></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">gen_docx_aic.sh</td>
    <td class="tg-0pky">Generates a loaded doc file</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">gen_pdf_aic.sh</td>
    <td class="tg-0pky">Generated a loaded pdf file</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">gen_pwprofile_aic.sh</td>
    <td class="tg-0pky">Generates a password list based on a user's name and location</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">gen_shex_aic.sh</td>
    <td class="tg-0pky">Converts a binary to shellcode</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">gen_usb_aic.sh</td>
    <td class="tg-0pky">Generates reverse shell and autorun.inf file for USB autorun hack</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">loc_mxsrv_aic.sh<br></td>
    <td class="tg-0pky">Locates open MX servers for email spoofing</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">lookup_sys_aic.sh</td>
    <td class="tg-0pky">Looks up syscalls on Linux systems</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">macro_http_enum.sh</td>
    <td class="tg-0pky">Opens multiple HTTP enumeration and scanning instances in different terminals<br></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">macro_win_enum.sh</td>
    <td class="tg-0pky">Opens multiple windows enumeration techniques in different terminals</td>
    <td class="tg-0pky">Incomplete</td>
  </tr>
  <tr>
    <td class="tg-0pky">mitm_arpspoof_aic.sh</td>
    <td class="tg-0pky">Executes a MITM arpspoof technique on the local network range</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">mitm_cleanarp_aic.sh</td>
    <td class="tg-0pky">Cleans up lingering processes left from mitm_arpspoof_aic.sh</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">mitm_sniff_aic.sh</td>
    <td class="tg-0pky">Instant network traffic sniffing for cookies | passwords | dns information<br></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">mitm_sslstrip_aic.sh</td>
    <td class="tg-0pky">Exectues MITM ssltrip on the local network<br></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">msf_handler_aic.sh</td>
    <td class="tg-0pky">Automatic execution of MSF multi-handler on port 443/tcp</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">persist_winexe_aic.cmd</td>
    <td class="tg-0pky">Windows batch command to establish standard "Run" persistence on a provided executable</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">recon_dns_aic.sh</td>
    <td class="tg-0pky">Automated DNS enumeration on a provided domain.&nbsp;&nbsp;</td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">spider_web_aic.sh</td>
    <td class="tg-0pky">Web spidering on a provided domain<br></td>
    <td class="tg-0pky">Broken</td>
  </tr>
  <tr>
    <td class="tg-0pky">updater.sh</td>
    <td class="tg-0pky">Updates msf, nmap, exploitdb, and various other tools<br></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
</tbody>
</table>
            
