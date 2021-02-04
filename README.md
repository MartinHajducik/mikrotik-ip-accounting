# mikrotik-ip-accounting
Unloading and storing Mikrotik IP Accounting details to MySQL database. This provides basic visibility about how much data local clients transmit and receive. Sample PHP script for displaying them as web content provided.

## Mikrotik setup
```bash
[user@RB] > ip accounting print
                enabled: yes
  account-local-traffic: no
              threshold: 8192
[user@RB] > ip accounting web-access print
  accessible-via-web: yes
             address: 0.0.0.0/0
```         
## Database setup 
- use dbtable.ssl to for table creation.

## Collecting data
- collect.pl script could be schedulled in CRON so it will periodically store data into database.

## PHP script for preview
- index.php provides sample visibility.


