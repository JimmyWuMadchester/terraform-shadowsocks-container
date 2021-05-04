declare -A locations=( ["uk"]="uksouth" ["us"]="eastus" ["jp"]="japaneast")
declare -A fqdns=( ["uk"]="ss4uk" ["us"]="ss4us" ["jp"]="ss4jp" )

# manage shadowsocks
function ssu() {
    az container start -g "${fqdns[$1]}-shadowsocks-resources" -n "${fqdns[$1]}-shadowsocks-${locations[$1]}"
}

function ssd() {
    az container stop -g "${fqdns[$1]}-shadowsocks-resources" -n "${fqdns[$1]}-shadowsocks-${locations[$1]}"
}

function ssr() {
    az container restart -g "${fqdns[$1]}-shadowsocks-resources" -n "${fqdns[$1]}-shadowsocks-${locations[$1]}"