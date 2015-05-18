#!/bin/bash

#Programmable head line and column separator. By default I assume data start at line 3 (first line is descriptio, second is column heads and third is actual data). Columns separated by tab(s).
head_line=1
col_sep="\t"

for freq in $(awk -v START=$head_line -v SEP=$col_sep -v FREQ=0 'BEGIN{FS = SEP} {if (NR > START && FREQ != $3) {FREQ=$3; print $3}}' $1)
do
	
	runtime=$(awk -v START=$head_line -v FREQ=$freq -v SEP=$col_sep -v COLUMN=2 'BEGIN{FS=SEP;total=0;count=0}{if(NR>START&&$3==FREQ){total=total+$COLUMN}}END{print total/3}' $1)
	
	echo -e "$runtime"

done

