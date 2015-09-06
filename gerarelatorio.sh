#!/bin/sh

mysql -uchile -p<senha> -h127.0.0.1 chile -v < queryTSS.sql > chile.csv

mysql -uargentina -p<senha> -h127.0.0.1 argentina -v < queryTSS.sql > argentina.csv

mysql -umexico -p<senha> -h127.0.0.1 mexico -v < queryTSS.sql > mexico.csv

mysql -ubrasil -p<senha> -h127.0.0.1 brasil -v < queryTSS.sql > brasil.csv

mysql -urdominicana -p<senha> -h127.0.0.1 rdominicana -v < queryTSS.sql > rdominicana.csv

mysql -uguatemala -p<senha> -h127.0.0.1 guatemala -v < queryTSS.sql > guatemala.csv

mysql -ucolombia -p<senha> -h127.0.0.1 colombia -v < queryTSS.sql > colombia.csv

mysql -uperu -p<senha> -h127.0.0.1 peru -v < queryTSS.sql > peru.csv

mysql -utssfixo_do -p<senha> -h127.0.0.1 tssfixo_do -v < queryTFX.sql > tssfixo_do.csv

mysql -utssfixo_gt -p<senha> -h127.0.0.1 tssfixo_gt -v < queryTFX.sql > tssfixo_gt.csv

