class brito-gnome {

yumgroup {'Development tools': ensure => present, } 
yumgroup {'GNOME Desktop Enviornment': ensure => present, } 
yumgroup {'X Window System': ensure => present, } 
yumgroup {'Fonts': ensure => present, } 


   }


