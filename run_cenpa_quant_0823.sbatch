#!/bin/bash
#SBATCH --job-name=A16_cenpa_quant
#SBATCH --partition=20
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16gb
#SBATCH --time=0-22:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jhe@wi.mit.edu

# Adjust to whatever conda env you have with cellprofiler installed
source /lab/cheeseman_sequencing/jhe/miniforge3/etc/profile.d/conda.sh
conda activate cellprofiler_env

# ---------------------------------------------------------------------------
# EDIT THESE THREE PATHS
# ---------------------------------------------------------------------------
PIPELINE=/nfs/cheeseman_dv/jiayi/cellprofiler/cenpa_quant_0823.cppipe         # path to the .cppipe file
INPUT_DIR=/nfs/cheeseman_dv/jiayi/20260821_24W_CenpA_maxprojected                 # folder with raw images + cell_mask/nucleus_mask tifs
OUTPUT_DIR=/nfs/cheeseman_dv/jiayi/A16_cellprofiler_results_cenpa_quant_0823                # folder where CSVs will be written
# ---------------------------------------------------------------------------

mkdir -p "$OUTPUT_DIR"

cellprofiler -c -r \
    -p "$PIPELINE" \
    -i "$INPUT_DIR" \
    -o "$OUTPUT_DIR"
