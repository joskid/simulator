#! /bin/bash

N=99  # Monitor apart
let P=N+1
R=100
STEP=10

B=1000
while [ $B -gt 1 ]; do
    time python3 ../../src/simulator.py run --set_of_rules DBS --number_of_peers $N --buffer_size $B --number_of_rounds $R | grep "CLR" | awk '{match($0,/CLR=[0-9.]+/);A=substr($0,RSTART,RLENGTH);sub(/.*=/,X,A);print A}' >> peers_${P}__buffer_size_${B}_DBS.txt
    let B=B-$STEP
done

B=1000
while [ $B -gt 1 ]; do
    time python3 ../../src/simulator.py run --set_of_rules DBS2 --number_of_peers $N --buffer_size $B --number_of_rounds $R | grep "CLR" | awk '{match($0,/CLR=[0-9.]+/);A=substr($0,RSTART,RLENGTH);sub(/.*=/,X,A);print A}' >> peers_${P}__buffer_size_${B}_DBS2.txt
    let B=B-$STEP
done
