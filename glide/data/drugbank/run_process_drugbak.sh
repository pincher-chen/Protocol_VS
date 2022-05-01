#!/bin/sh
unzip drugbank_all_3d_structures.sdf.zip
babel 3D\ structures.sdf -osd drugbank_db.sd -m

#change file name by drugbank ID
for i in `ls *.sd`;do
   name_id_t=`sed -n -e '/DATABASE_ID/=' $i`
   name_id=$((${name_id_t}+1))
   db_name=`sed -n -e "${name_id}p" $i`
   mv -v $i ${db_name}.sd
done
mkdir -p ../docking_file
mv -v *.sd ../docking_file

