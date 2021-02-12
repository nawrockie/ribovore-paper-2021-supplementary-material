#!/bin/bash
# rnammer-tests.sh
# Eric Nawrocki and Alejandro Schaffer
# Jan 29, 2021
# 
# This file includes instructions for running the RNAmmer tests
# described in the paper "Ribovore: ribosomal RNA sequence analysis
# for GenBank submissions and database curation".
# 
# Instructions are included below for running RNAmmer on two
# different datasets described more in the paper:
# yarza
# silvaref
# 
# Reproducing the RNAmmer results in the paper:
# 
# Required software and input files:
# RNAmmer v1.2
# yarza.fa
# silvaref.fa
#
# 1. install RNAmmer v1.2 from http://www.cbs.dtu.dk/services/RNAmmer/
#
# 2. gunzip required input files (if you haven't done this already):
gunzip yarza.fa.gz
gunzip silvaref.fa.gz
#
# 3. run ribodbmaker.pl with the following commands:
# yarza
rnammer -S euk -m ssu -f yarza.pass.fa -h yarza.hmmreport yarza.fa
# silvaref
rnammer -S euk -m lsu -f silvaref.pass.fa -h silvaref.hmmreport silvaref.fa
#
# Output files created by the above commands:
# yarza.pass.fa:   fasta file with 'passing' sequences
# yarza.hmmreport: HMMER output from RNAmmer
# silvaref.pass.fa:   fasta file with 'passing' sequences
# silvaref.hmmreport: HMMER output from RNAmmer
# 
# Gzipped copies of the output files obtained from our runs of RNAmmer
# are included in this tarball:
# rnammer.yarza.pass.fa.gz
# rnammer.yarza.hmmreport.gz
# rnammer.silvaref.pass.fa.gz
# rnammer.silvaref.hmmreport.gz
# 
#
# RNAmmer reference:
# Lagesen K, Hallin PF, Rodland E, Staefeldt HH, Rognes T, Ussery DW;
# RNammer: consistent annotation of rRNA genes in genomic sequences;
# Nucleic Acids Res. 2007 Apr 22.
# ====================================================================
#
# Question/problems? email eric.nawrocki@nih.gov
