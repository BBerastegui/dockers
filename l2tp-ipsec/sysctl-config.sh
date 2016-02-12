# Credits: https://gist.github.com/mietek/4877cd74423bf6925b92

cat <<EOF >>/etc/sysctl.conf
net.ipv4.ip_forward=1

net.ipv4.conf.all.accept_redirects=0
net.ipv4.conf.default.accept_redirects=0

net.ipv4.conf.all.send_redirects=0
net.ipv4.conf.default.send_redirects=0

net.ipv4.conf.all.rp_filter=0
net.ipv4.conf.default.rp_filter=0
net.ipv4.conf.eth0.rp_filter=0
net.ipv4.conf.lo.rp_filter=0
EOF

# For DigitalOcean
cat<<EOF >>/etc/sysctl.conf
net.ipv4.conf.ip_vti0.rp_filter=0
EOF

sysctl -p
