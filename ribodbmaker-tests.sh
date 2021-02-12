#!/bin/bash
# ribodbmaker-tests.sh
# Eric Nawrocki and Alejandro Schaffer
# Jan 29, 2021
# 
# This file includes instructions for running the ribodbmaker tests
# described in the paper "Ribovore: ribosomal RNA sequence analysis
# for GenBank submissions and database curation".
# 
# Instructions are included below for running ribodbmaker on four
# different datasets described more in the paper:
# yarza
# silvaref
# silvaparc
# microsporidia 
# 
# This file is split into two sections:
# Section 1: version 0.40
# Section 2: version 1.0
# 
# The first section gives instructions on how to run the tests using
# version Ribovore v0.40 giving results that (nearly identically)
# match what is in the paper. 
#
# The second section runs the tests with Ribovore v1.0.
#
# Note that these tests will only run on linux systems because
# ribodbmaker only runs on linux.
# 
# =======================================================================
# Section 1: version 0.40
#
# Reproducing the test results in the paper as closely as possible using 
# Ribovore version 0.40. Exact reproduction may not be possible because
# of changes to the NCBI taxonomy database which is continuously updated.
# 
# Required software and input files:
# Ribovore v0.40
# yarza.fa
# yarza.tax.txt
# silvaref.fa
# silvaref.tax.txt
# silvaparc.fa
# silvaparc-and-microsporidia.tax.txt
# microsporidia.fa
# silvaparc-and-microsporidia.tax.txt
#
# 1. install Ribovore v0.40 using instructions in the INSTALLATION
#    section of the README.txt file here:
#    https://github.com/ncbi/ribovore/blob/ribovore-0.40/README.txt
#    Make sure you set your environment variables as explained in the
#    README.txt file (and remove any definitions of environment
#    variables from your .bashrc or .cshrc from other installations of
#    Ribovore (for example, version 1.0) if you have installed other
#    versions).
#
# 2. gunzip required input files:
gunzip yarza.fa.gz
gunzip yarza.tax.txt.gz
gunzip silvaref.fa.gz
gunzip silvaref.tax.txt.gz
gunzip silvaparc.fa.gz
gunzip silvaparc-and-microsporidia.tax.txt.gz
gunzip microsporidia.fa.gz
#
# 3. run ribodbmaker.pl with the following commands:
# yarza
ribodbmaker.pl -f --taxin yarza.tax.txt --skipclustr --model SSU.Eukarya --fmlpos 604 --fmrpos 1070 --fmnogap --indiffseqtax yarza.fa rdb-yarza
# silvaref
ribodbmaker.pl -f --taxin silvaref.tax.txt --skipclustr --model LSU.Eukarya --fmlpos 124 --fmrpos 627 --fmnogap --indiffseqtax silvaref.fa rdb-silvaref
# silvaparc
ribodbmaker.pl -f --taxin silvaparc-and-microsporidia.tax.txt --skipclustr --model LSU.Eukarya --fmlpos 124 --fmrpos 627 --fmnogap --pidmax 71000 --indiffseqtax silvaparc.fa rdb-silvaparc
# microsporidia
ribodbmaker.pl -f --taxin silvaparc-and-microsporidia.tax.txt --skipclustr --model SSU.Euk-Microsporidia --fmlpos 380 --fmrpos 800 --fmnogap --indiffseqtax microsporidia.fa rdb-microsporidia
#
# After running one or more of the above commands the output files will be in the newly created directories:
# rdb-yarza
# rdb-silvaref
# rdb-silvaparc
# rdb-microsporidia
# 
# See 
# https://github.com/ncbi/ribovore/blob/ribovore-1.0/documentation/ribodbmaker.md 
# for more information on the output files.
#
# ====================================================================
# Section 2: version 1.0 
# 
# Redoing the ribodbmaker test results for the 'yarza' dataset using 
# Ribovore version 1.0. These results will likely not match exactly 
# what is reported in the paper due to changes to the NCBI taxonomy
# database which is continuously updated, and minor changes between
# Ribovore versions 0.40 and 1.0.
# 
# Commands below are commented out in lines that begin with '###'
# remove the '###' to run these commands but first comment out the 
# commands above in Section 1.
#
# You can run these commands without the '--taxin <taxfile>' option to 
# use the default taxonomy tree included in Ribovore v1.0.
#
# You can also run these commands with an updated taxonomy tree file
# using the '--taxin' option with an updated tree file. 
# See the instructions at the page below for updating the tree:
# https://github.com/ncbi/ribovore/blob/ribovore-1.0/documentation/ribodbmaker.md#updatetaxonomy
#
# Required input files and software:
# Ribovore v1.0
# yarza.fa
# yarza.tax.txt
# silvaref.fa
# silvaref.tax.txt
# silvaparc.fa
# silvaparc-and-microsporidia.tax.txt
# microsporidia.fa
# silvaparc-and-microsporidia.tax.txt
#
# 1. install Ribovore v1.0 using instructions in the INSTALLATION
#    section of the install.md file here:
#    https://github.com/ncbi/ribovore/blob/ribovore-1.0/documentation/install.md
#    Make sure you set your environment variables as explained in the
#    install.md file (and remove any definitions of environment
#    variables from your .bashrc or .cshrc from other installations of
#    Ribovore (for example, version 0.40) if you have installed other
#    versions).
#
# 2. gunzip required input files (if you haven't already done this for section 1 above):
###gunzip yarza.fa.gz
###gunzip yarza.tax.txt.gz
###gunzip silvaref.fa.gz
###gunzip silvaref.tax.txt.gz
###gunzip silvaparc.fa.gz
###gunzip silvaparc-and-microsporidia.tax.txt.gz
###gunzip microsporidia.fa.gz
#
# 3. run ribodbmaker with the following commands, noting that in comparison to 0.40, 
#    the .pl suffix is dropped:
###ribodbmaker -f --taxin yarza.tax.txt --skipclustr --model SSU.Eukarya --fmlpos 604 --fmrpos 1070 --fmnogap --indiffseqtax yarza.fa rdb-yarza
# silvaref
###ribodbmaker -f --taxin silvaref.tax.txt --skipclustr --model LSU.Eukarya --fmlpos 124 --fmrpos 627 --fmnogap --indiffseqtax silvaref.fa rdb-silvaref
# silvaparc
###ribodbmaker -f --taxin silvaparc-and-microsporidia.tax.txt --skipclustr --model LSU.Eukarya --fmlpos 124 --fmrpos 627 --fmnogap --pidmax 71000 --indiffseqtax silvaparc.fa rdb-silvaparc
# microsporidia
###ribodbmaker -f --taxin silvaparc-and-microsporidia.tax.txt --skipclustr --model SSU.Euk-Microsporidia --fmlpos 380 --fmrpos 800 --fmnogap --indiffseqtax microsporidia.fa rdb-microsporidia
#
# After running one or more of the above commands the output files will be in the newly created directories:
# rdb-yarza
# rdb-silvaref
# rdb-silvaparc
# rdb-microsporidia
# 
# See 
# https://github.com/ncbi/ribovore/blob/ribovore-1.0/documentation/ribodbmaker.md 
# for more information on the output files.
#
# ====================================================================
# Question/problems/feature requests? email eric.nawrocki@nih.gov
