#!/bin/sh
module load g_mmpbsa/5.1.4-gcc-4.8.5
module load Python/3.6.3
sc=./mmpbsa

echo 0|  gmx_mpi trjconv -f ../md_0_add_900ns.xtc -o md_900-1000ns.xtc -n ../../index.ndx -pbc nojump -dt 1000 -b 400000 -e 450000
echo 1 13 |  g_mmpbsa -f md_900-1000ns.xtc -s ../md_0_add_900ns.tpr -n ../../index.ndx -mme -pdie 2 -decomp
echo 1 13 | g_mmpbsa -f md_900-1000ns.xtc -s ../md_0_add_900ns.tpr -n ../../index.ndx -i ${sc}/polar.mdp -nomme -pbsa -decomp
echo 1 13 | g_mmpbsa -f md_900-1000ns.xtc -s ../md_0_add_900ns.tpr -n ../../index.ndx -i ${sc}/apolar_sasa.mdp -nomme -pbsa -decomp -apol apolar.xvg -apcon apolar_contrib.dat
python ${sc}/MmPbSaStat.py -m energy_MM.xvg -p polar.xvg -a apolar.xvg
