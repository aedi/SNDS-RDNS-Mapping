$key = "SNDS KEY GOES HERE"

$content = invoke-webrequest https://sendersupport.olc.protection.outlook.com/snds/ipStatus.aspx?key=$key

$IPs = $content.Content -split "`r`n"

foreach($IP in $IPs) {
    if($IP -ne "") {
        $ipos = $IP.IndexOf(",")
        $lIP = $IP.Substring(0, $ipos)
        $rdns = (Resolve-DnsName $lIP).NameHost
        Write-Host "$lIP - $rdns"
    }
}