cat <<EOF >/etc/xl2tpd/xl2tpd.conf
[global]
ipsec saref = yes
access control = no

[lns default]
ip range = 10.1.10.2-10.1.10.255
local ip = 10.1.10.1
refuse chap = yes
refuse pap = yes
require authentication = yes
pppoptfile = /etc/ppp/xl2tpd-options
length bit = yes
EOF

cp /etc/ppp/options /etc/ppp/xl2tpd-options

cat <<EOF >>/etc/ppp/xl2tpd-options
require-mschap-v2
ms-dns 8.8.8.8
ms-dns 8.8.4.4
EOF

cat <<EOF >/etc/ppp/chap-secrets
pppuser * ppppassword *
EOF

chmod 600 /etc/ppp/chap-secrets
