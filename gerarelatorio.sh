#!/bin/sh

mysql -utss_chile -p<senha> -h127.0.0.1 tss_chile -v < queryTSS.sql > tss_chile.csv

mysql -utss_argentina -p<senha> -h127.0.0.1 tss_argentina -v < queryTSS.sql > tss_argentina.csv

mysql -utss_mexico -p<senha> -h127.0.0.1 tss_mexico -v < queryTSS.sql > tss_mexico.csv

mysql -utss_brasil -p<senha> -h127.0.0.1 tss_brasil -v < queryTSS.sql > tss_brasil.csv

mysql -utss_rdominicana -p<senha> -h127.0.0.1 tss_rdominicana -v < queryTSS.sql > tss_rdominicana.csv

mysql -utss_guatemala -p<senha> -h127.0.0.1 tss_guatemala -v < queryTSS.sql > tss_guatemala.csv

mysql -utss_colombia -p<senha> -h127.0.0.1 tss_colombia -v < queryTSS.sql > tss_colombia.csv

mysql -utss_peru -p<senha> -h127.0.0.1 tss_peru -v < queryTSS.sql > tss_peru.csv

mysql -utssfixo_do -p<senha> -h127.0.0.1 tssfixo_do -v < queryTFX.sql > tssfixo_do.csv

mysql -utssfixo_gt -p<senha> -h127.0.0.1 tssfixo_gt -v < queryTFX.sql > tssfixo_gt.csv

