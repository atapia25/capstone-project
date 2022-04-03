averages :
	python3 average.py
	./intermediate.sh

data :
	./get_data.sh

graph :
	gnuplot sageplot.gnuplot

display :
	evince Node_Temp_Graph.pdf

all : clean data averages graph display


clean :
	rm -rf ambient.csv ambient_15min.csv system.csv system_15min.csv atmos.csv *.pdf combined_15min.csv ambient_atmos10.hist ambient_atmos60.hist atmos_15min.csv system_ambient.hist
