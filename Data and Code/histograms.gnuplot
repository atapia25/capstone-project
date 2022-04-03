set boxwidth 0.8 relative
set style fill solid 1.0
set term pdf size 90,25 enhanced font 'Verdane,28'
set xlabel "Temperature Diff deg Celsius"
set ylabel "Count"
set ytics 5
set mytics 4
set grid y mytics

set output "System-ambient.pdf"
plot 'system_ambient.hist' using 1:xtic(2) with boxes title "Occurrence"

set output "Ambient-atmos60.pdf"
plot 'ambient_atmos60.hist' using 1:xtic(2) with boxes title "Occurrence"

set output "Ambient-atmos10.pdf"
plot 'ambient_atmos10.hist' using 1:xtic(1) with boxes title "Occurrence"