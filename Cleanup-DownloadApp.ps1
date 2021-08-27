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

function cleanupFolder (){
    hostname

    #==========================================
    # Removes Temp Folder from DownloadApp script
    #==========================================

    rmdir -R C:\TempDownload\




}


foreach ($server in $servers){
    Invoke-Command -ComputerName $server -ScriptBlock ${function:cleanupFolder}
    }

# FINAL NOTES
# 1) Yes, I probably could have writen this better...
# 2) I take absolutely no responsibility to what these scripts do to you or your devices, you are the one running them :)