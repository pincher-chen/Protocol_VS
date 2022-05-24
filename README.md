# Protocol_VS
A protocol for high throughput screening of ACE2 enzymatic activators to treat COVID-19 induced metabolic complications.

# Molecule docking
## How to prepare the input files  
We recemmond use graphical user interface (UI) of Schrödinger software to pre-process protein, as well as prepare the receptor grid generation by using SiteMap tool. Run the following script to prepare the input files for docking.
```
bash run_process_drugbak.sh
```

## How to run molecular docking
#By command
```
${Schrodinger_HOME}/glide glide_docking.in -NJOBS 24 -HOST localhost:24
```
Here we use 24 CPU cores to run 24 jobs for docking.
#By UI of Schrödinger software
Just follow the manual of Schrödinger software.

# Moecular dynamics
When complex.gro file is generated, just run the following command:
```
bash run_gromacs.sh
```
This script contains energy minization, NVT and NPT steps. Modify the relevant parameters according to your needs

# MMGBSA
Run the following script to calculate binding affinity by MM-GBSA method. 
```
bash mmpbsa_run.sh 
```
The last 100 ns trajectories were used for analysis.
