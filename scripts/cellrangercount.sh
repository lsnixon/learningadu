#!/bin/sh
#SBATCH --job-name n10x_count
#SBATCH --mem 75G
#SBATCH --tasks 20
#SBATCH --output %x.%j.stdout
#SBATCH --error %x.%j.stderr
#SBATCH --partition cpu-med
#SBATCH --time 08:00:00 ## HH:MM:SS
#SBATCH --propagate=NONE 


#source settings 
source $HOME/.bash_profile 

#Folder you want it in 
cd /research/labs/neurology/fryer/m297377/learningadu/counts

#get cellranger version 
cellranger -V

### count --id <ID> --transcriptome <PATH> --fastqs <PATH> --libraries <CSV>
#run cellranger
cellranger count --id IgG_Female_939A \
  --transcriptome /research/labs/neurology/fryer/projects/references/mouse/refdata-gex-mm10-2020-A \
  --localmem=75  \
  --localcores=20 \
  --fastqs /research/labs/neurology/fryer/projects/aducanumab/mouse/scRNA \
  --sample=939A_IgG_Female \
  
##Key 
# --id, A unique run id and output folder name - can rename at this point 
# --transcriptome, Path of folder containing 10x-compatible transcriptome reference 
# localmem, Set max GB the pipeline may request at one time. Only applies to local jobs
# localcores, Set max cores the pipeline may request at one time. Only applies to local jobs
# --fastqs, Path to input FASTQ data
# --sample, Prefix of the filenames of FASTQs to select
