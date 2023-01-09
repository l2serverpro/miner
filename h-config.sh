#!/usr/bin/env bash

function miner_ver() {
	local MINER_VER=$MINIZ_VER
	[[ -z $MINER_VER ]] && MINER_VER=$MINER_LATEST_VER
	echo $MINER_VER
}


function miner_config_echo() {
	local MINER_VER=`miner_ver`
	miner_echo_config_file "$MINER_DIR/$MINER_VER/dynex.conf"
}

function miner_config_gen() {
local MINER_CONFIG="$MINER_DIR/$MINER_VER/dynex.conf"

[[ -z $DSTM_PORT && $DSTM_SERVER =~ (.*):([0-9]+) ]] && DSTM_SERVER=${BASH_REMATCH[1]} && DSTM_PORT=${BASH_REMATCH[2]}

conf=""
conf+="WAL=\"$ZTEMPLATE\""$'\n'
conf+="HOST=\"$ZSERVER\""$'\n'
conf+="PORT=\"$ZPORT\""$'\n'
conf+="PASS=\"$ZPASS\""$'\n'
conf+="EXTRA=\"$Z_USER_CONFIG\""$'\n'

echo "$conf" > $MINER_CONFIG

}
