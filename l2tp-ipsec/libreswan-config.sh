cat <<EOF >/etc/ipsec.d/l2tp-psk.conf
conn L2TP-PSK-NAT
        rightsubnet=vhost:%priv
        also=L2TP-PSK-noNAT

conn L2TP-PSK-noNAT
        # Use a Preshared Key. Disable Perfect Forward Secrecy.
        authby=secret
        pfs=no
        auto=add
        keyingtries=3
        # we cannot rekey for %any, let client rekey
        rekey=no
        # Apple iOS doesn't send delete notify so we need dead peer detection
        # to detect vanishing clients
        dpddelay=10
        dpdtimeout=90
        dpdaction=clear
        # Set ikelifetime and keylife to same defaults windows has
        ikelifetime=8h
        keylife=1h
        # l2tp-over-ipsec is transport mode
        type=transport
        #
        # left will be filled in automatically with the local address of the default-route interface (as determined at IPsec startup time).
        left=%defaultroute
        #
        # For updated Windows 2000/XP clients,
        # to support old clients as well, use leftprotoport=17/%any
        leftprotoport=17/1701
        #
        # The remote user.
        #
        right=%any
        # Using the magic port of "%any" means "any one single port". This is
        # a work around required for Apple OSX clients that use a randomly
        # high port.
        rightprotoport=17/%any
EOF

cat <<EOF >>/etc/ipsec.conf
include /etc/ipsec.d/l2tp-psk.conf
EOF

cat <<EOF >/etc/ipsec.secrets
%any: PSK "__PRE_SHARED_KEY__"
EOF

chmod 600 /etc/ipsec.secrets
