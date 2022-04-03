set term pdf size 90,25 enhanced font 'Verdana,48'
set xlabel "\nDate/Time UTC" # label for the Y axis
set ylabel 'Temperature deg C' # label for the X axis
set output "W039_differences.pdf"
set datafile separator ','
set xdata time
set ytics 2
set mytics 4
set grid y my

plot "temp_diff_15min.csv" u (timecolumn(2,"%Y-%m-%d %H:%M:%S+00:00")):3 pointinterval 400 with linespoints title "Difference between System and Ambient Temperature"
     #"atmos.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):2 pointinterval 400 with linespoints title "ATMOS-60M", \
     #"atmos.csv" u (timecolumn(1,"%Y-%m-%d %H:%M:%S+00:00")):10 pointinterval 400 with linespoints title "ATMOS-10M"