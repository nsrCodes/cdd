package main
import(
	"path/filepath"

	"gcdd/cmd"
	"gcdd/db"

	"github.com/mitchellh/go-homedir"
)
func main(){
	home, _ := homedir.Dir()
	dbPath := filepath.Join(home, "cdd.db")
	err := db.Init(dbPath)
	if err != nil {
		panic(err)
	}
	cmd.Execute()
}