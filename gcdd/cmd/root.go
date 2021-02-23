package cmd
import (
	"github.com/spf13/cobra"
	"fmt"
	"os"
	"gcdd/db"
)

var (
	// Used for flags.
	listFlag 	bool
)

var RootCmd = &cobra.Command{
  Use:   "gcdd",
  Short: "CDD is a wrapper around cd to provide dynamic directory traversal",
  Long: "You can use cdd just like cd while at the same time also using aliases to directories that you traverse the most thorugh your terminal",
  Args: func(cmd *cobra.Command, args []string) error {
  	if listFlag || len(args) == 1 {
		return nil
	} else if len(args) == 0 {
		return fmt.Errorf("Need atleast One argument")
	} 
	return fmt.Errorf("Too many arguments")
  },
  Run: func(cmd *cobra.Command, args []string) {
	if listFlag {
		aliases, err := db.AllAliases()
		if err != nil {
			fmt.Println(err)
			return
		}

		if len(aliases)>0{
			fmt.Println("You have created the following aliases: ")
			for _, alias := range aliases {
				fmt.Printf("%s : %s \n", alias.Name, alias.Target)
			}
		} else {
			fmt.Println("You have not created any aliases")
			fmt.Println("Create One using the add command")
			fmt.Println("Use the -h tag to learn more about it")
		}

		os.Exit(1)
	} else {
		userInp := args[0]
		path, err := getPathFromUserInput(userInp)
		if err != nil {
			fmt.Println(err)
			return 
		}else {
			fmt.Println(path)
		}
	}
	
	},
}

// Execute executes the root command.
func Execute() {
	if err := RootCmd.Execute(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func init() {
	RootCmd.PersistentFlags().BoolVarP(&listFlag, "list", "l",false, "List stuff")
}

func getPathFromUserInput(input string) (string, error) {
	if isValidPath(input) {
		return input, nil
	} else {
		if target, err := db.GetAliasTarget(input); err==nil {
			return target, nil
		}
		return "", fmt.Errorf("Invalid path")
	}
}