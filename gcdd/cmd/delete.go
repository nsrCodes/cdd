package cmd

import (
	"fmt"
	"gcdd/db"

	"github.com/spf13/cobra"
)

var deleteCmd = &cobra.Command{
	Use:   "delete <alias_name>",
	Short: "Delete an existing alias",
	Long:  "You can provide more than one space separated aliases and all the valid ones will be deleted",
	Args:  cobra.MinimumNArgs(1),
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("[Warning] Once deleted alias cannot be used later")
		for _, arg := range args {
			_, err := db.GetAliasTarget(arg)
			if err == nil {
				err := db.DeleteAlias(arg)
				if err != nil {
					fmt.Println(err)
				} else {
					fmt.Println("Deleted Alias: ", arg)
				}
			} else {
				fmt.Println("Invalid Alias: ", arg)
			}
		}
	},
}

func init() {
	RootCmd.AddCommand(deleteCmd)
}
