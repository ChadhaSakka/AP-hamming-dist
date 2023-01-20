#!/bin/bash

read -p "Enter the length of the dna sequence = " n
read -p "Enter the compiler name [gcc/clang]= " cc

for flags in "O0" "O1" "O2" "O3" "Ofast"
do
#clean repo
make clean
#modifier makefile
sed -i "/CC=/c\CC=$cc" Makefile
if [ $cc = "gcc" ]; then
sed -i "/OFLAGS=/c\OFLAGS=-march=native -$flags -fopt-info-all=dist.gcc.optrpt
" Makefile
else
sed -i "/OFLAGS=/c\OFLAGS=-march=native -$flags " Makefile
fi
#compilation								
make
#Execution with specifing the sequence length
./genseq s1.dna $n
./genseq s2.dna $n
#recup perf measures in .dat
if [ -e "$n"_dna_dist_"$cc"_"$flags".dat ]; then
rm "$n"_dna_dist_"$cc"_"$flags".dat;
fi
#sudo cpupower -c all frequency-set -g performance
#sudo taskset -c 1 ./dist "s1.dna" "s2.dna" | awk '{gsub(/;/,"")}1' >> "$n"_dna_dist_"$cc"_"$flags".dat

./dist "s1.dna" "s2.dna" | awk '{gsub(/;/,"")}1' >> "$n"_dna_dist_"$cc"_"$flags".dat
#./dist "s1.dna" "s2.dna" >> "$n"_dna_dist_"$cc"_"$flags".dat

mv "$n"_dna_dist_"$cc"_"$flags".dat Results

done


