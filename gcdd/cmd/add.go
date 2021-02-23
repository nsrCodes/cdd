package cmd

import (
	"fmt"
	"path/filepath"
	"os"

	"gcdd/db"

	"github.com/spf13/cobra"
)

// TODO: add aliases as create and update
var addCmd = &cobra.Command{
	Use:   "add <alias_name> <target/relative_destination>",
	Short: "Create an alias for a destination",
	Long: "Add is used to create aliases to destinations that you regularly visit using your terminal.\nMake sure to provide a unique alias_name rather than an existing one. \nDoing so Will update the old alias. You can check those using the -l flag",
	Args: cobra.ExactArgs(2),
	Run: func(cmd *cobra.Command, args []string) {
		if len(args) == 2{
			name, target := args[0], args[1]
			pathToTarget, _ := filepath.Abs(target)
			if isValidPath(pathToTarget) {
				// fmt.Println(pathToTarget)
				db.CreateAlias(name, pathToTarget)
			}
		} else {
			fmt.Println("There should be two args to add an alias")
		}
	},
}

func isValidPath(fp string) bool {
	if _, err := os.Stat(fp); os.IsNotExist(err) {
		// fmt.Println("file does not exist", fp)
		return false
	}
	return true
}

func init() {
	RootCmd.AddCommand(addCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// addCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// addCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
