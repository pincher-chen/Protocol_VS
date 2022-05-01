#!/bin/sh
grep "ATOM " 6m0j-ori.pdb  > 6m0j-p.pdb
#Submit job on tianhe-2 supercompuer.
#PRE="yhrun -p MEM_128 "
#otherwise
PRE="mpirun "

#choose 5: AMBER99SB
#choose 5: SPC for waters.
$PRE -n 1 gmx_mpi pdb2gmx -f 6m0j-p.pdb -o 6m0j_processed.gro
$PRE -n 1 gmx_mpi editconf -f complex.gro -o newbox.gro -c -d 1.0 -bt cubic
$PRE -n 1 gmx_mpi solvate -cp newbox.gro -cs spc216.gro -p topol.top -o solv.gro  
$PRE -n 1 gmx_mpi grompp -f em.mdp -c solv.gro -r solv.gro -p topol.top -o ions.tpr -maxwarn 2  
#Total charge in system -25.000 e
$PRE -n 1 gmx_mpi genion -s ions.tpr -o solv_ions.gro -p topol.top -pname NA -nname CL -np 25

#em
$PRE -n 1 gmx_mpi grompp -f em.mdp -c solv_ions.gro -p topol.top -o em.tpr
$PRE  -N 4 -n 64 gmx_mpi mdrun -v -deffnm em
$PRE -n 1 gmx_mpi make_ndx -f ligand.gro -o index_ligand.ndx
$PRE -n 1 gmx_mpi genrestr -f ligand.gro -n index_ligand.ndx -o posre_ligand.itp -fc 1000 1000 1000
$PRE -n1 gmx_mpi make_ndx -f em.gro -o index.ndx

#nvt
$PRE -N 1 -n 1  gmx_mpi grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -n index.ndx -o nvt.tpr
$PRE -N 10 -n 160 gmx_mpi  mdrun -v -deffnm nvt

#npt
$PRE -N 1 -n 1 gmx_mpi grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p topol.top -n index.ndx -o npt.tpr
$PRE -N 10 -n 160 gmx_mpi mdrun -v -deffnm npt

$PRE  -n 1  gmx_mpi grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -n index.ndx -o md_0_1000.tpr
$PRE -N 10 -n 160 gmx_mpi mdrun -deffnm md_0_1000




