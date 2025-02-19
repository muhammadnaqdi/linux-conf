if [ $1 = "google" ]; then
    echo "nameserver 8.8.8.8" >  /etc/resolv.conf
    echo "nameserver 8.8.4.4"   >> /etc/resolv.conf
elif  [ $1 = "shecan" ]; then
    echo "nameserver 178.22.122.100" >  /etc/resolv.conf
    echo "nameserver 185.51.200.2" >> /etc/resolv.conf
elif [ $1 = "403" ]; then
    echo "nameserver 10.202.10.202" >  /etc/resolv.conf
    echo "nameserver 10.202.10.102" >> /etc/resolv.conf
elif [ $1 = "flare" ]; then
    echo "nameserver 1.1.1.1" >  /etc/resolv.conf
    echo "nameserver 1.0.0.1" >> /etc/resolv.conf
else
    echo "nameserver $1" >  /etc/resolv.conf
    echo "nameserver $2" >> /etc/resolv.conf
fi
