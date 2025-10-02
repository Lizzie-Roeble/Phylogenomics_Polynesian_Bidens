#!/bin/bash
#SBATCH --time=6:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8GB
#SBATCH --job-name=trimmomatic_batch
#SBATCH --output=trimmomatic_%j.out

# Start: Run this from the 0_raw_sequences/Island directory

# Make trimmed directory (if not already) and copy raw reads there
mkdir -p ../1_trimmed/
cp *.fastq.gz ../1_trimmed/

# move into the trimmed reads directory
cd ../1_trimmed/

# Standardize file names (remove extra Illumina suffixes)
# remove the filter extension (.filt.)
rename _001_AHGTCYDMXY.filt.fastq.gz .fastq.gz *_001_AHGTCYDMXY.filt.fastq.gz
rename _001_BHT35KDRX2.filt.fastq.gz .fastq.gz *_001_BHT35KDRX2.filt.fastq.gz
# This is updated to the run specific file name, but generalized command:
# rename .filt.fastq.gz .fastq.gz *.filt.fastq.gz

# Unzip fastq.gz files
for zip in *.fastq.gz; do
    gunzip "$zip"
done

# Load environment with Trimmomatic
module load tools/zsh    # needed for conda on Koa
source $HOME/miniconda3/etc/profile.d/conda.sh
conda activate $HOME/software/preprocessing

# Run Trimmomatic

Total=$(ls *_R1.fastq | wc -l)

for i in $(eval echo {1..$Total}); do
    seq1=$(ls *_R1.fastq | head -n $i | tail -1)
    seq2=$(echo $seq1 | sed 's/_R1/_R2/g')
    name=$(basename $seq1 _R1.fastq)

    trimmomatic PE -threads 4 -trimlog Trimlog.txt \
      $seq1 $seq2 \
      ${name}_1P.fastq ${name}_1U.fastq \
      ${name}_2P.fastq ${name}_2U.fastq \
      ILLUMINACLIP:$CONDA_PREFIX/share/trimmomatic*/adapters/TruSeq3-PE-2.fa:2:30:10:1:true \
      LEADING:10 TRAILING:10 SLIDINGWINDOW:4:20 MINLEN:40
done

# Organize output

# Create paired and unpaired directories
mkdir -p paired unpaired
mv *P.fastq paired/
mv *U.fastq unpaired/

# Delete unnecessary files to free up storage space
rm *_R*.fastq
