package config

import (
	"fmt"
	"gopkg.in/yaml.v2"
	"io/ioutil"
)

type ConsulConfig struct {
	Address 	string `yaml:"consulAddress"`
 	Port  		int32	`yaml:"consulPort"`
	AclToken 	string	`yaml:"consulAclToken"`
	Scheme 	string		`yaml:"consulScheme"`
}

func  GetConsulConfig(filePathName string) *ConsulConfig  {
	configFile,err := ioutil.ReadFile(filePathName)

	if err !=nil{
		fmt.Print(err)
		return nil
	}
	c := new(ConsulConfig);
	yamlerr:=yaml.Unmarshal(configFile,c)
	if yamlerr !=nil{
		fmt.Print(yamlerr)
		return nil
	}
	return c;
}