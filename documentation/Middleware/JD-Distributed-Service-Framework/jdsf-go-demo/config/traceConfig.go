package config

import (
	"fmt"
	"gopkg.in/yaml.v2"
	"io/ioutil"
)

type TraceConfig struct {
	Enable bool `yaml:"enable"`
	SimpleType string `yaml:"simpleType"`
	SimpleRate  float64 `yaml:"simpleRate"`
	TraceUdpAddress string `yaml:"traceUdpAddress"`
	TraceUdpPort int `yaml:"traceUdpPort"`
	TraceHttpAddress string `yaml:"traceHttpAddress"`
	TraceHttpPort int `yaml:"traceHttpPort"`
}


type AppTraceConfig struct {
	AppTraceConfig TraceConfig `yaml:"traceConfig"`
}

func  GetTraceConfig(filePathName string) *TraceConfig  {
	configFile,err := ioutil.ReadFile(filePathName)

	if err !=nil{
		fmt.Print(err)
		return nil
	}
	c := new(AppTraceConfig);
	yamlerr:=yaml.Unmarshal(configFile,c)
	if yamlerr !=nil{
		fmt.Print(yamlerr)
		return nil
	}
	return &c.AppTraceConfig;
}