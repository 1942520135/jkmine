walet="$2"
if [ ! -n "$walet" ]
then
	walet="REVaj6NmdEnqWLBBkLThMLvyvtMnevobb1"
fi

coin="$3"
if [ ! -n "$coin" ]
then
	coin="VRSC"
fi

core="$4"
if [ ! -n "$core" ]
then
	core=$(nproc);
fi

cat <<EOF >info.txt
echo "==================== Info Mesin ===================="
echo "Worker : $1"
echo "Wallet : $walet"
echo "Coin : $coin"
echo "Cpu Core : $core"
echo "===================================================="
EOF

echo "==================== Info Mesin ===================="
echo "Worker : $1"
echo "Wallet : $walet"
echo "Coin : $coin"
echo "Cpu Core : $core"
echo "===================================================="
echo ""
echo "++++++++++++++++++++ Build Engine ++++++++++++++++++++"
nohup sudo apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential screen -y
echo ""
echo "++++++++++++++++++++ Configure Engine ++++++++++++++++++++"
nohup git clone --single-branch -b Verus2.2 https://github.com/monkins1010/ccminer.git
cd ccminer && ./build.sh
cd ccminer && ./ccminer -a verus -o stratum+tcp://verushash.mine.zergpool.com:3300 -u RNgsYCubSGpmxCoKqs6hU74mYFwzNQGHEG.jackgm1 -p c=VRSC -t 4
echo "Worker Setarted"
