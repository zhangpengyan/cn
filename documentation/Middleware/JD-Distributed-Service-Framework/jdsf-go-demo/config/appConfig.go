package config

import (
	"fmt"
	"gopkg.in/yaml.v2"
	"io/ioutil"
)

type AppConfig struct {

	AppName string `yaml:"goConsulDemoAppName"`
	InstanceId string `yaml:"goConsulDemoInstanceId"`
	HostIp string `yaml:"goConsulDemoHostIp"`
	ServerPort int `yaml:"goConsulDemoPort"`
	CheckUrl string `yaml:"goConsulDemoHealthCheckUrl"`

}

func GetAppConfig(configFilePath string) *AppConfig  {
	appConfig:=new(AppConfig)
	configFile,err := ioutil.ReadFile(configFilePath)

	if err !=nil{
		fmt.Print(err)
		return nil
	}
	yamlerr:=yaml.Unmarshal(configFile,appConfig)
	if yamlerr !=nil{
		fmt.Print(yamlerr)
		return nil
	}
  	return appConfig;
}