# Protocol_VS
A protocol for high throughput screening of ACE2 enzymatic activators to treat COVID-19 induced metabolic complications.

# Molecule docking
## How to prepare the input files  
Run the bash script “bash run_process_drugbak.sh” to prepare the input files for docking.

We recemmond use graphical user interface (UI) of Schrödinger software to pre-process protein.

Prepare the receptor grid generation by using SiteMap tool in Schrödinger software.

## How to run molecular docking
#By command
```
${Schrodinger_HOME}/glide $1 -NJOBS 24 -HOST localhost:24
```
Here we use 24 CPU cores to run 24 jobs for docking.
#By UI of Schrödinger software
Just follow the manual of Schrödinger software.

# MMGBSA
Run the bash script “bash mmpbsa_run.sh” to calculate binding affinity by MM-GBSA method. 
The last 100 ns trajectories were used for analysis.
