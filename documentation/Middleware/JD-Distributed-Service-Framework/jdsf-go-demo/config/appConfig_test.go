package config

import (
	"fmt"
	"testing"
)

func TestGetAppConfig(t *testing.T) {
	appConfig := GetAppConfig("../conf/appConfig.yaml")
	fmt.Print(appConfig)
}

func TestGetConsulConfig(t *testing.T) {
	consulConfig := GetConsulConfig("../conf/appConfig.yaml")

	fmt.Print(consulConfig)
}