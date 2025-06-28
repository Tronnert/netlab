$TTL    604800
@       IN      SOA     local.com. admin.local.com. (
                          3         ; Serial
                     604800         ; Refresh
                      86400         ; Retry
                    2419200         ; Expire
                     604800 )       ; Negative Cache TTL
;
; Name servers
@       IN      NS      ns1.local.com.

; A records
ns1     IN      A       10.60.0.1
test    IN      A       10.10.0.10
