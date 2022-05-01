#!/bin/sh
for i in `ls data/docking_file/*.sd`;do
  echo $i >> tmp_file
done

file_list=`cat ./tmp_file | tr '\n' ','` 
rm tmp_file
echo "GRIDFILE   ./1R42-grid_1.zip
LIGANDFILES   ${file_list}
POSE_OUTTYPE   ligandlib_sd
PRECISION   SP" > glide_docking.in
