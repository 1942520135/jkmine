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

echo "==================== Info Mesin ===================="
echo "Worker : $1"
echo "Wallet : $walet"
echo "Coin : $coin"
echo "Cpu Core : $core"
echo "===================================================="
cd liebe && ./liebe -a verus -o stratum+tcp://verushash.mine.zergpool.com:3300 -u $walet.$1 -p c=$coin -t $core