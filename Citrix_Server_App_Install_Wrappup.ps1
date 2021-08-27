#=====================================================================================
# IMPORTANT: run this as admin from a domain-joined server after editing.
#
# I use this to wrap up app installs on domain joined citrix servers
# All it does is set mode to execute and re-enable logins
# I typically run from AD server or other server that can reach the XD or CTX servers
#
#
#=====================================================================================
# See Below example of line 17
#=====================================================================================
#=====================================================================================
# $servers += "VCD4-CTX-01","VCD5-CTX-05","VCD4-XD-02", ETC
#=====================================================================================

$servers= @()
$servers += "<hostname1>","<hostname2>","<hostname3>"

function wrapUp (){
    hostname

    #===================== 
    #Enabling logons and setting to execute
    #===================== 
    change user /execute
    change logon /enable
}


foreach ($server in $servers){
    Invoke-Command -ComputerName $server -ScriptBlock ${function:wrapUp}
    }


# FINAL NOTES
# 1) Yes, I probably could have writen this better...
# 2) I take absolutely no responsibility to what these scripts do to you or your devices, you are the one running them :)