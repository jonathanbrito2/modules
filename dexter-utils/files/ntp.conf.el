driftfile /var/lib/ntp/drift
statistics loopstats peerstats clockstats

server ntp.ancinerj.gov.br iburst
#server 0.south-america.pool.ntp.org iburst
#server 1.south-america.pool.ntp.org iburst
#server 2.south-america.pool.ntp.org iburst
#server 3.south-america.pool.ntp.org iburst
restrict -4 default kod notrap nomodify nopeer noquery
restrict -6 default kod notrap nomodify nopeer noquery
restrict 10.1.120.0 mask 255.255.248.0 nomodify notrap

includefile /etc/ntp/crypto/pw
keys /etc/ntp/keys
