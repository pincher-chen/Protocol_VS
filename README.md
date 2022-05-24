# Protocol_VS
A protocol for high throughput screening of ACE2 enzymatic activators to treat COVID-19 induced metabolic complications.

# Molecule docking
## How to prepare ligands
Run the bash script “bash run_process_drugbak.sh” to prepare the input files for docking.

## How to prepare protein
We recemmond use graphical user interface of Schrödinger software to pre-process protein.

## Hoo to prepare input files for glid
Prepare the receptor grid generation by using SiteMap tool in Schrödinger software.

# MMGBSA
Run the bash script “bash mmpbsa_run.sh” to calculate binding affinity by MM-GBSA method. The last 100 ns trajectories were used for analysis.
