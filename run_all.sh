#!/bin/bash

#
# OverpassAPI only considers named, enclosed polygons as areas by default.
# The scripts in this folder generate areas for *ALL* enclosed polygons in the world
# This process can take *MONTHS*, so don't expect it to be quick.
#
# Copy this directory over to the OverpassAPI server and run with `nohup ./run_all.sh &`
# Check all scripts complete by using `grep -B 5 "FINISHING" nohup.out`
# 
# This process also uses a *LOT* of memory. It has only been tested on an OverpassAPI
# configured with 30GB RAM (open `src/overpass_api/core/settings.cc` and replace both
# lines that discuss `available_space` before compiling and installing OverpassAPI).
#

for f in `ls -1`; do
	if [ "$f" == "run_all.sh" ]
	then
		continue
	fi

	if [ "$f" == "nohup.out" ]
	then
		continue
	fi

	echo "----------------------- STARTING: $f"
	/bin/osm3s_query --progress --rules <$f
	echo "----------------------- FINISHING: $f"
done