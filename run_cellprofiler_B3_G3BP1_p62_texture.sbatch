#!/bin/bash
#SBATCH --job-name=B13_G3BP1_p62
#SBATCH --partition=20
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16gb
#SBATCH --time=0-12:00:00
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
PIPELINE=/nfs/cheeseman_dv/jiayi/cellprofiler/B3_G3BP1_p62_texture_0820.cppipe        # path to the .cppipe file
INPUT_DIR=/nfs/cheeseman_dv/jiayi/B3_20260727_Nikon/unprocessedtiff/G3BP1_z15                # folder with raw images + cell_mask/nucleus_mask tifs
OUTPUT_DIR=/nfs/cheeseman_dv/jiayi/B3_20260727_Nikon/cellprofiler_results_texture_0820                # folder where CSVs will be written
# ---------------------------------------------------------------------------

mkdir -p "$OUTPUT_DIR"

cellprofiler -c -r \
    -p "$PIPELINE" \
    -i "$INPUT_DIR" \
    -o "$OUTPUT_DIR"
