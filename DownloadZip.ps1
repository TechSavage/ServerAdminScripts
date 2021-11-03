#=====================================================================================
# IMPORTANT: run this as admin from a domain-joined server after editing 
#=====================================================================================
# See Below example of line 11
#=====================================================================================
#=====================================================================================
# $servers += "VCD4-AD-01","VCD5-AD-05","VCD4-AD-02"
#=====================================================================================

$servers= @()
$servers += "<hostname1>","<hostname2>","<hostname3>"

function downloadZip (){
    #===================
    # Displays Hostname
    #===================

    hostname

    #=====================================================================================
    # Makes Temp Folder and Downloads zip file from url and extracts zip to created folder
    #=====================================================================================
    #=====================================================================================
    # IMPORTANT: See below exmaple for line 33 & 39
    #=====================================================================================
    # Invoke-WebRequest https:/xxx.xxx.xxx/master.zip -OutFile C:\TempDownload\download.zip
    #=====================================================================================
        
    mkdir C:\TempDownload
    
    try { 
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Invoke-WebRequest <URI here> -OutFile C:\TempDownload\download.zip
        }
    catch {
        Write-Host "An error occurred... trying without tls 1.2"
        }
    finally {
        Invoke-WebRequest <URI here> -OutFile C:\TempDownload\download.zip
            }
    Expand-Archive C:\TempDownload\download.zip -DestinationPath C:\TempDownload\
    del C:\TempDownload\download.zip

}

foreach ($server in $servers){
    Invoke-Command -ComputerName $server -ScriptBlock ${function:downloadZip}
    }

# FINAL NOTES
# 1) Yes, I probably could have writen this better...
# 2) I take absolutely no responsibility to what these scripts do to you or your devices, you are the one running them :)
