# ============================================================
# PHYLOGENETIC TREE COMPARISON
# Command line to obtain tree files for each typing method 
# @author Charlotte HERICE
# @date June 2026
# ============================================================

#### WG SNP (coding and non-coding)

mafft --auto Data/wg_SNP.fasta > Data/wg_SNP_aligned.fasta
snp-sites -o Data/wg_SNP_only.fasta Data/wg_SNP_aligned.fasta
./../../../../../libs/RAxML-NG/raxml-ng --msa Data/wg_SNP_only.fasta --model GTR+G --prefix Trees/wg_SNP --all --bs-trees 100


### CG MLST (coding only)

mafft --auto Data/cg_MLST.fasta > Data/cg_MLST_aligned.fasta
./../../../../../libs/RAxML-NG/raxml-ng --msa Data/cg_MLST_aligned.fasta --model GTR+G --prefix Trees/cg_MLST --all --bs-trees 100


### hMy MLST (human)

mafft --auto Data/hMy_MLST.fasta > Data/hMy_MLST_aligned.fasta
./../../../../../libs/RAxML-NG/raxml-ng --msa Data/hMy_MLST_aligned.fasta --model GTR+G --prefix Trees/hMy_MLST --all --bs-trees 100


### mgpB 

mafft --auto Data/mgpB.fasta > Data/mgpB_aligned.fasta
./../../../../../libs/RAxML-NG/raxml-ng --msa Data/mgpB_aligned.fasta --model GTR+G --prefix Trees/mgpB --all --bs-trees 100




