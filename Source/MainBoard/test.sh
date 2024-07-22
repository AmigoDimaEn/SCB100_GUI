#!/bin/bash

#UnableTTYS
A()
{
	r="A\n"
	echo $r
}

B()
{
	r="B\n"
	echo $r
}

C()
{
	r="C\n"
	echo $r
}

for cnt in $(seq 1 4)
do
	case $cnt in
		1) res=$(A);;
		2) res=$res$(B);;
		3) res=$res$(C);;
		*) echo -e $res
	esac

done


