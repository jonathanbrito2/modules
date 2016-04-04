node 'ancinet.ancinerj.gov.br' {
  
      include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }

node 'rj-blcsei-01.ancinerj.gov.br' {
  
      include dexter-utils
      #include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }


node 'db-sei-enterprise.ancinerj.gov.br' {
  
      include dexter-utils
      #include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }

node 'rj-convertsei-01.ancinerj.gov.br' {
  
      include dexter-utils
      #include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }


node 'rj-appsei-02.ancinerj.gov.br' {
  
      include dexter-utils
      #include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }


node 'rj-appsei-03.ancinerj.gov.br' {
  
      include dexter-utils
      #include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }



node 'cliente.ancine.gov.br' {
  
      include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }

node 'rj-ain-desenv.ancine.gov.br' {
  
      include dexter-utils
#      include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }

node 'orasisrh.ancinerj.gov.br' {
  
      include dexter-utils
#     include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }

node 'rj-desenv-portal.ancinerj.gov.br' {
  
      include dexter-utils
#     include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      #include dexter-mcollective
  
   }

node 'rj-jb5-hml-asi01.ancinerj.gov.br' {
  
      include dexter-utils
#      include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }


node 'puppetmaster.ancine.gov.br' {
  
      include dexter-utils
      include dexter-ssh
      include dexter-ntp
#     include dexter-mcollective
      #import "/etc/puppet/manifests/senha_root.pp"
   }

node 'teste-link.ancinerj.gov.br' {
  
      include dexter-utils
#      include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
  
   }


