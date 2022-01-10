##  iperf3 - binaries for windows  
Benchmark your network limits  

### Intro
iperf3 can be used to measure maximum network throughput. It allows to calibrate several parameters like timing, buffers, protocols and streams that can help in network optimization. Each test shows various network performance metrics including throughput, jitter and packet loss. iperf3 results are considered much more accurate and reliable.  

Last official binary release version was 3.1.3 for Windows in 2016 . This repo is created for iperf3 pre-compiled binaries for Windows. **The goal is to create iperf3 Windows executable without any modification in original source code.** Each binary released is checked with [VirusTotal](https://www.virustotal.com/gui/home/upload) before upload.  

#
### Builds
|iperf Ver|Cygwin Ver      |OS          |
|:-------:|:--------------:|:----------:|
|3.10.1   |3.3.3-341.x86_64|Win10 64-bit|

#### Benchmark
* Many folks use iperf to evaluate internet speed. Public servers are available under links section.  
* Each binary goes through below tests before release:  
&nbsp;•&nbsp; Download | Upload | Client mode | Server mode | Parallel streams  

#### Distribution
* Variations of available distributions summarized below:
  
  > |Distro Name                     |OpenSSL|Extra Feature |Info         |
  > |:-------------------------------|:------|:-------------|:------------|
  > |`iperf-<ver>-win64`             |No     |              |`Recommended`|
  > |`iperf-<ver>-win64-static-auth` |Yes    |authentication|             |
  > |`iperf-<ver>-win64-dynamic-auth`|Yes    |authentication|             |

#
> **_NOTE:_**  
> Optional features in iperf3 are OS specific. Some features utilize functions and modules that are available under certain  kernels. `iperf -v` lists available features.  
#

### Links
Manual &nbsp;•&nbsp; https://software.es.net/iperf/invoking.html#iperf3-manual-page  
Source Code &nbsp;•&nbsp; https://github.com/esnet/iperf  
Public Servers &nbsp;•&nbsp; https://iperf.fr/iperf-servers.php  

#
### Disclaimer  
> This repo is not associated with iperf, ESnet. iperf source code copyright and disclaimer applies to this binary distribution.  
