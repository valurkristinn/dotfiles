#!/usr/bin/env bash

# ───── CONFIGURE THESE ─────
QBT_CONF="/Users/valur/.config/qBittorrent/qBittorrent.ini"
MAX_WAIT=60
# ────────────────────────────

get_default_iface() {
  route get 1.1.1.1 2>/dev/null | awk '/interface: / { print $2 }'
}

# Function: Check if VPN is up by seeing if default route goes through utun*
is_vpn_up() {
  local iface
  iface=$(get_default_iface)
  [[ $iface == utun* ]]
}

# Function: Get the actual utun interface being used for internet access
get_vpn_iface() {
  local iface
  iface=$(get_default_iface)
  if [[ $iface == utun* ]]; then
    echo "$iface"
  fi
}
# Function: launch Eddie GUI and click "Connect"
connect_via_gui() {
  echo "🔄 Launching Eddie.app…"
  open -j -a Eddie
  sleep 3

  echo "🔘 Triggering Connect button in GUI…"
  osascript <<EOF
tell application "System Events"
	tell process "Eddie"
		try
		    click radio button "Overview" of tab group 1 of window 1
		end try
		delay 1
		try
		    click button "Connect to a recommended server" of group 1 of group 1 of tab group 1 of window 1
		end try
	end tell
end tell
EOF
}

# Step 1: Ensure VPN is connected
if ! is_vpn_up; then
  echo "⚠️ VPN not detected. Connecting via GUI..."
  connect_via_gui
fi

# Step 2: Wait up to MAX_WAIT for VPN to become active
echo "⏳ Waiting for VPN interface to become active..."
ELAPSED=0
while ! is_vpn_up; do
  sleep 3
  ELAPSED=$((ELAPSED + 3))
  echo "⏱️  Waited $ELAPSED seconds…"
  if (( ELAPSED >= MAX_WAIT )); then
    echo "❌ Timeout: VPN interface did not appear."
    exit 1
  fi
done

# Get confirmed VPN interface and IP
VPN_IFACE=$(get_vpn_iface)
VPN_IP=$(ipconfig getifaddr "$VPN_IFACE")
echo "✅ VPN is active on $VPN_IFACE with IP $VPN_IP"

# Step 3: Update qBittorrent config
if [[ ! -f "$QBT_CONF" ]]; then
  echo "❌ qBittorrent config not found at $QBT_CONF"
  echo "   Please run qBittorrent at least once first."
  exit 1
fi

echo "🛠️ Updating qBittorrent config to bind to $VPN_IFACE …"
cp "$QBT_CONF" "${QBT_CONF}.bak"

# Use sed to safely update both Interface and InterfaceName
sed -i '' -E \
  -e "s|(Session\\\Interface=).*|\1$VPN_IFACE|" \
  -e "s|(Session\\\InterfaceName=).*|\1$VPN_IFACE|" \
  "$QBT_CONF"

# Step 4: Launch qBittorrent
echo "🚀 Launching qBittorrent..."
open -a qBittorrent

echo "🎉 Done. Script exiting."
exit 0
