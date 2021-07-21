#!/bin/bash -l
#SBATCH -J "checksum_batchX"
#SBATCH -A snic20XX-XX-XXX
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -o log.checksum_batchX.log
#SBATCH -e log.error.checksum_batchX.log


#provide target directory (containing the files that are specified in SciLife's .md5 files) as well as a file containing a list of all *.md5 files

Dir1="path/to/batch2/"

Md5List="path/to/md5list.txt"

Md5sums=$(paste $Md5List)

echo "Comparing checksums for" $Dir1

#loop through each .md5 file
for i in ${Md5sums[@]}
do
      #get the first file + its relative path and its respective md5sum from .md5 file
    ReadA=$(cat ${i} | awk 'NR==1 {print $2}')
	CsumA=$(cat ${i} | awk 'NR==1 {print $1}')
	
	  #perform the actual check using the provided md5sum and calculating the md5sum for the file in the target directory
	echo "Checking md5sums for:"
	md5sum -c <<< "$CsumA  $Dir1${ReadA}"
	
	  #same procedure but for the second file within *.md5
	ReadB=$(cat ${i} | awk 'NR==2 {print $2}')
	CsumB=$(cat ${i} | awk 'NR==2 {print $1}')
	
	echo "Checking md5sums for:"
	md5sum -c <<< "$CsumB  $Dir1${ReadB}"
	
	printf "\n"
done

