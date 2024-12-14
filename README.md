##  iperf3 - binaries for windows  
Benchmark your network limits  
<div align="center">

![iperf3](https://img.shields.io/badge/-iperf3-D8BFD8?logo=speedtest&logoColor=3a3a3d)
&nbsp;&nbsp;[![release](https://img.shields.io/github/v/release/ar51an/iperf3-win-builds?display_name=release&logo=rstudio&color=90EE90&logoColor=8FBC8F)](https://github.com/ar51an/iperf3-win-builds/releases/latest/)
&nbsp;&nbsp;![downloads](https://img.shields.io/github/downloads/ar51an/iperf3-win-builds/total?color=orange&label=downloads&logo=github)
&nbsp;&nbsp;![visitors](https://img.shields.io/endpoint?color=4883c2&label=visitors&logo=github&url=https%3A%2F%2Fhits.dwyl.com%2Far51an%2Fiperf3-win-builds.json)
&nbsp;&nbsp;![stars](https://img.shields.io/github/stars/ar51an/iperf3-win-builds?style=social&logo=apachespark)
</div>

<div align="justify">

### Intro
iperf3 can be used to measure maximum network throughput. It allows to calibrate several parameters like timing, buffers, protocols and streams that can help in network optimization. Each test shows various network performance metrics including throughput, jitter and packet loss. iperf3 results are considered much more accurate and reliable.  

Last official binary release version was 3.1.3 for Windows in 2016 . This repo is created for iperf3 pre-compiled binaries for Windows. **The goal is to create iperf3 Windows executable without any modification in original source code.** Each binary released is checked with [VirusTotal](https://www.virustotal.com/gui/home/upload) before upload.  

#
### Builds
|iperf Ver    |Cygwin Ver      |OS          |OpenSSL Ver|
|:-----------:|:--------------:|:----------:|:---------:|
|3.18         |3.5.4-1.x86_64  |Win11 64-bit|3.0.15     |
|3.17.1       |3.5.3-1.x86_64  |Win11 64-bit|3.0.13     |
|3.16         |3.4.10-1.x86_64 |Win11 64-bit|3.0.12     |

#### Benchmark
* Many folks use iperf to evaluate internet speed. Public servers are available under links section.  
* Each binary goes through below tests before release:  
&nbsp;•&nbsp; Download | Upload | Client mode | Server mode | Parallel streams  

#### Release
* Variations of available release files summarized below:
  
  > |Release File                        |OpenSSL|Extra Feature |Info         |
  > |:-----------------------------------|:------|:-------------|:------------|
  > |`iperf-<ver>-win64.zip`             |No     |              |`Recommended`|
  > |`iperf-<ver>-win64-static-auth.zip` |Yes    |authentication|             |
  > |`iperf-<ver>-win64-dynamic-auth.zip`|Yes    |authentication|             |
  > |`iperf-<ver>-win7-64Bit.zip`        |No     |              |For Win7     |

#
> **_NOTE:_**  
> Optional features in iperf3 are OS specific. Some features utilize functions and modules that are available under certain  kernels. `iperf -v` lists available features.  
#

### Links
* **Reference**  
Updates about iperf3 Windows binary release are available in a discussion thread at [Neowin](https://www.neowin.net/forum/topic/1234695-iperf/) maintained by _**budman**_. It is mentioned in official docs at [Obtaining iperf3](https://github.com/esnet/iperf/blob/master/docs/obtaining.rst).
* **Public Servers:**  
  • https://github.com/R0GGER/public-iperf3-servers - `Recommended`  
  • https://as62240.net/speedtest  
  • Few US Servers:

  > |Server Name                         |Location|Ports    |
  > |:-----------------------------------|:-------|:--------|
  > |nyc.speedtest.clouvider.net         |NY      |5200-5209|
  > |speedgauge2.optonline.net           |NY      |5201     |
  > |charlotte02.speedtest.windstream.net|NC      |5201     |
  > |iperf3.velocityonline.net           |FL      |5201-5210|
  > |la.speedtest.clouvider.net          |LA      |5200-5209|
  > |iperf.scottlinux.com                |CA      |5201     |

* **Manual:**  
  • https://software.es.net/iperf/invoking.html#iperf3-manual-page
* **Source Code:**  
  • https://github.com/esnet/iperf

#
### Speed Test
|Test        |Cmd                                    |
|:-----------|:--------------------------------------|
|TCP Download|`iperf3.exe -c <server> -P 10 -4 -R`   |
|TCP Upload  |`iperf3.exe -c <server> -P 10 -4`      |
|UDP Download|`iperf3.exe -c <server> -u -P 10 -4 -R`|
|UDP Upload  |`iperf3.exe -c <server> -u -P 10 -4`   |
  
#
### Disclaimer  
> esnet/iperf source code copyright and disclaimer applies to this binary distribution. Check [License](https://github.com/esnet/iperf/blob/master/LICENSE) for further details.
</div>
