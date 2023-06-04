#!/usr/bin/env bash
GO_OUTPUT=`gcdd $@`
output_line_count=`echo "$GO_OUTPUT" | wc -l`

if [[ output_line_count -lt 2 ]]; 
then
	cd "$GO_OUTPUT"
else
	echo "$GO_OUTPUT"
fi