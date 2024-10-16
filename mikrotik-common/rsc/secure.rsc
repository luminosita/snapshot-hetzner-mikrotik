/tool 
mac-server set allowed-interface-list=none
mac-server mac-winbox set allowed-interface-list=none
mac-server ping set enabled=no
bandwidth-server set enabled=no 

/ip 
neighbor discovery-settings set discover-interface-list=none 
proxy set enabled=no
socks set enabled=no
upnp set enabled=no
cloud set ddns-enabled=no update-time=no
ssh set strong-crypto=yes

# /lcd set enabled=no

#FIXME
#/interface print
#/interface set x disabled=yes
