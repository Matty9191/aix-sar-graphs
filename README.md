# Generate AIX Performance Graphs

The aix-sar-graphs tools allow you to collect sar data from an AIX host and plot it with gnuplot. To get a useful graph you will first need to run r-sar-data.sh on a server to grab CPU, memory, disk, etc. data. The script takes the sa file days you want to collect (so to collect june 24 - june 27 you would run the script with the option 24 25 26 27):

$ gather-sar-data.sh 24 25 26 27 > sarcpu.in

Once you have the sar data you can fire up GNUplot to produce a graph:

$ gnuplot sar-gnuplot.cfg

A sample gnuplot configuration file is included with this repo.

