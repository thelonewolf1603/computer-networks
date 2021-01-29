sudo ip netns add 'neel-1'
sudo ip netns add 'neel-2'

sudo ip link add 'veth0' type veth peer name 'veth1'

sudo ip link set 'veth0' netns 'neel-1'
sudo ip link set 'veth1' netns 'neel-2'

sudo ip netns exec 'neel-1' ip addr add 10.1.1.0/24 dev veth0
sudo ip netns exec 'neel-2' ip addr add 10.1.2.0/24 dev veth1

sudo ip netns exec 'neel-1' ip link set dev veth0 up
sudo ip netns exec 'neel-2' ip link set dev veth1 up
