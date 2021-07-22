# checksum_scilife
A short script to check md5sums from SciLife deliveries which come with provided .md5 files

## Introduction

This short script will help checking md5sums between SciLife deliveries that have been transferred to another directory (following identical subdirectories). **Note** that this script is written to work on Uppmax' rackham, so if you want to run it on another cluster or locally, the head would have to be adjusted. 

It can also be used on other original files, but they have to come with .md5 files for each sample and look like this:

    ```bash
    d3a8389612d9bdaef0bfbf8e13c13047  P21518_1001/02-FASTQ/210706_A00621_0443_BHCYLCDSX2/P21518_1001_S1_L001_R2_001.fastq.gz
    5c3df76890e2024bfaa124a5446ad460  P21518_1001/02-FASTQ/210706_A00621_0443_BHCYLCDSX2/P21518_1001_S1_L001_R1_001.fastq.gz
    ```

I may expand this repo later on to include a script which can check md5sums between files with different relative paths and names.

## Instructions

First simply adjust the head to your liking (naming of job & log files) and enter your SNIC project ID if you wish to run it on rackham. Specify the directory into which the original files have been transfered to under `Dir1="..."`. Lastly give the path to a file containing a list of all .md5 files (one file per row) under `Md5sums="..."`. This file can easily be created using e.g. `find . -name "*[0-9].md5 > md5list.txt"`
