#!/bin/zsh
GO_OUTPUT=`gcdd $@`
output_line_count=`echo "$GO_OUTPUT" | wc -l`

if ! command -v open &>/dev/null ; 
	then { 
		printf "The open command is not available in your \$PATH \\nThis installation was expecting you are on macOS. macs usually have the open command preinstalled \\n " ; 
	} 
	else {
		# my very hacky way of distinguishing error from actuall output
		if [[ output_line_count -lt 2 ]]; 
			then
				open "$GO_OUTPUT"
			else
				echo "$GO_OUTPUT"
		fi
	}
fi
