#=====================================================================================
# IMPORTANT: run this as admin from a domain-joined server after editing.
#
# I use this to prep domain joined citrix servers  for application install
# note, if you run this while on one of the target servers, you will be logged out.
# I typically run from AD server or other server that can reach the XD or CTX servers
#
#
#=====================================================================================
# See Below example of line 18
#=====================================================================================
#=====================================================================================
# $servers += "VCD4-CTX-01","VCD5-CTX-05","VCD4-XD-02"
#=====================================================================================


$servers= @()
$servers += "<hostname1>","<hostname2>","<hostname3>"

function prep (){
    hostname

    #===================== 
    #Disabling logons and setting to install mode
    #===================== 
    change logon /disable
    change user /install

    #=====================
    # Logging out users
    #===================== 
    quser | Select-String "Disc" | ForEach {logoff ($_.tostring() -split ' +')[2]}
    start-sleep -Seconds 30
    quser | Select-String "Acti" | ForEach {logoff ($_.tostring() -split ' +')[2]}
    start-sleep -Seconds 30

}


foreach ($server in $servers){
    Invoke-Command -ComputerName $server -ScriptBlock ${function:prep}
    }

# FINAL NOTES
# 1) Yes, I probably could have writen this better...
# 2) I take absolutely no responsibility to what these scripts do to you or your devices, you are the one running them :)
