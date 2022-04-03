set term pdf size 90,25 enhanced font 'Verdana,48'
set xlabel "\nDate/Time UTC"
set ylabel 'Temperature deg C'
set output "Node_Temp_Graph.pdf"
set datafile separator ','
set xdata time
set ytics 2
set mytics 4
set grid y my
#set key autotitle columnhead

# plot "ambient.csv" u (timecolumn(1,"%Y-%m-%dT%H:%M:%SZ")):2 pointinterval 400 with linespoints title "Node Ambient (BME680)",\
#      "system.csv" u (timecolumn(1,"%Y-%m-%dT%H:%M:%SZ")):2 pointinterval 400 with linespoints title "Node Core (BME280)", \
#      "atmos.csv" u (timecolumn(1,"%Y-%m-%dT%H:%M:%SZ")):2 pointinterval 400 with linespoints title "ATMOS-60M", \
#      "atmos.csv" u (timecolumn(1,"%Y-%m-%dT%H:%M:%SZ")):10 pointinterval 400 with linespoints title "ATMOS-10M"

# plot "ambient_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):2 pointinterval 400 with linespoints title "Node Ambient (BME680)",\
#      "system_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):2 pointinterval 400 with linespoints title "Node Core (BME280)", \
#      "atmos_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):2 pointinterval 400 with linespoints title "ATMOS-60M", \
#      "atmos_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):3 pointinterval 400 with linespoints title "ATMOS-10M"

# plot "combined_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):(column("temp_system")-column("temp_ambient")) pointinterval 400 with linespoints title "System-Ambient", \
#      "combined_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):(column("temp_atmos_10")-column("temp_atmos_60")) pointinterval 400 with linespoints title "ATMOS10-ATMOS60",\
#      "combined_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):(column("temp_ambient")-column("temp_atmos_10")) pointinterval 400 with linespoints title "Ambient-ATMOS10"

plot "combined_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):(column("temp_atmos_10")-column("temp_atmos_60")) pointinterval 400 with linespoints title "ATMOS10-ATMOS60",\
     "combined_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):(column("temp_ambient")-column("temp_atmos_10")) pointinterval 400 with linespoints title "Ambient-ATMOS10"

#plot "combined_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):(column("temp_ambient")-column("temp_atmos_10")) pointinterval 400 with linespoints title "Ambient-ATMOS10"

# plot "ambient_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):2 pointinterval 400 with linespoints title "Node Ambient (BME680)",\
#      "system_15min.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):2 pointinterval 400 with linespoints title "Node Core (BME280)"

#
# set title font "Helvetica,24"
# set title "DeltaT System-Ambient - Old Core"
# set xlabel "\n Delta deg C"
# set ylabel "\n Counts"
# set style data histograms
# set style fill solid
# plot 'system_ambient.hist' using 1:xtic(2) title "Occurrence"
