package db

import (
	"fmt"
	"time"
	"github.com/boltdb/bolt"
)
var aliasBucket = []byte("alias")
var db *bolt.DB

type Alias struct {
	Name string
	Target string
}

func Init(dbPath string) error {
	var err error
	db, err = bolt.Open(dbPath, 0600, &bolt.Options{Timeout: 1 * time.Second})
	if err != nil {
		return err
	}
	return db.Update(func(tx *bolt.Tx) error {
		_, err := tx.CreateBucketIfNotExists(aliasBucket)
		return err
	})
}

func CreateAlias(name string, target string) (int, error) {
	var id int
	err := db.Update(func(tx *bolt.Tx) error {
		b := tx.Bucket(aliasBucket)
		return b.Put([]byte(name), []byte(target))
	})
	if err != nil {
		return -1, err
	}
	return id, nil
}

func DeleteAlias(name string) error {
	return db.Update(func(tx *bolt.Tx) error {
		b := tx.Bucket(aliasBucket)
		return b.Delete([]byte(name))
	})
}

func AllAliases() ([]Alias, error) {
	var aliases []Alias
	err := db.View(func(tx *bolt.Tx) error {
		b := tx.Bucket(aliasBucket)
		c := b.Cursor()

		for k, v := c.First(); k != nil ; k, v = c.Next() {
			aliases = append(aliases, Alias{
				Name: string(k),
				Target: string(v),
			})
		}

		return nil
	})

	if err != nil {
		return nil, err
	}
	return aliases, nil
}

func GetAliasTarget(checkStr string) (string, error) {
	aliases, err := AllAliases()
	if err != nil {
		return "", err
	}
	for _, alias := range aliases {
		if alias.Name == checkStr {
			return alias.Target, nil
		}
	}

	return "", fmt.Errorf("No Such Alias")
}