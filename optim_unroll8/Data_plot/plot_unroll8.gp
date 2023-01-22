#!/usr/local/bin/gnuplot -persist

set terminal pngcairo font "georgia,16" fontscale 1.0 size 1400, 700 
set output '65536_dna_un8.png'

set boxwidth 0.9 absolute
set style fill solid 1.00 border lt -1
set key fixed right top vertical Right nobox
set style histogram clustered gap 1 title textcolor lt -1 
set style data histograms
set grid 

set xtics border in scale 0,0 nomirror rotate by -45  autojustify 
set xtics   ()

set xrange [ 0: * ] 
set yrange [ * : * ] 

#set multiplot layout 2,2 rowsfirst 
set ylabel " elapsed (ns)"
set xlabel " Different flags with GCC/Clang"

set title 'Different optim flags with gcc & clang on unrolled hamming loop x8'

plot '65536_dna_dist_gcc_O0.dat' using 2:xtic(2) ti "gcc : -O0" lc rgb 'black','65536_dna_dist_gcc_O1.dat' using 2:xtic(2) ti "-O1" lc rgb 'grey20', '65536_dna_dist_gcc_O2.dat' using 2:xtic(2) ti "-O2" lc rgb 'grey40','65536_dna_dist_gcc_O3.dat' using 2:xtic(2) ti "-O3" lc rgb 'grey60', '65536_dna_dist_gcc_Ofast.dat' using 2:xtic(2) ti "-Ofast" lc rgb 'grey', '65536_dna_dist_clang_O0.dat' using 2:xtic(2) ti "clang : -O0" lc rgb 'dark-red','65536_dna_dist_clang_O1.dat' using 2:xtic(2) ti "-O1" lc rgb 'red','65536_dna_dist_clang_O2.dat' using 2:xtic(2) ti "-O2" lc rgb 'light-red','65536_dna_dist_clang_O3.dat' using 2:xtic(2) ti "-O3" lc rgb 'light-coral','65536_dna_dist_clang_Ofast.dat' using 2:xtic(2) ti "-Ofast" lc rgb 'light-pink'


replot
#unset multiplot
