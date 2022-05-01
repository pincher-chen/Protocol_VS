#!/bin/sh
#decompress files
tar xzvf smi.tar.gz

#convert smi to 3D sd file format. 
mkdir -p sd
for i in  `ls ./smi/*.smi`;do
  echo $i
  j=`echo $i | cut -d '/' -f 3|cut -d '.' -f 1`
  ligprep -ismi $i -osd ./sd/$j.sd -epik
  echo $j
done

mkdir -p ../docking_file
mv -v ./sd/*.sd ../docking_file
