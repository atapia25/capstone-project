#!/bin/bash
awk -F, -v OFS=',' '{ printf "%.1f\n",$3-$2 }' combined_15min.csv | sort -n | uniq -c | tr -s " " | sort -n -k 2 > system_ambient.hist
awk -F, -v OFS=',' '{ printf "%.1f\n",$2-$4 }' combined_15min.csv | sort -n | uniq -c | tr -s " " | sort -n -k 2 > ambient_atmos60.hist
awk -F, -v OFS=',' '{ printf "%.1f\n",$2-$5 }' combined_15min.csv | sort -n | uniq -c | tr -s " " | sort -n -k 2 > ambient_atmos10.hist
