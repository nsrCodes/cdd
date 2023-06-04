#!/usr/bin/env bash
GO_OUTPUT=`gcdd $@`
output_line_count=`echo "$GO_OUTPUT" | wc -l`

if ! command -v xdg-open &>/dev/null ; 
	then { 
		printf "The xdg-open command is not available in your \$PATH \\nIt is usually installed with the package xdg-utils \\n " ; 
	} 
	else {
		if [[ output_line_count -lt 2 ]]; 
			then
				nautilus "$GO_OUTPUT"
			else
				echo "$GO_OUTPUT"
		fi
	}
fi
