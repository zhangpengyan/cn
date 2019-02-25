package config

import (
	"fmt"
	"testing"
)

func TestGetTraceConfig(t *testing.T) {
	tc := GetTraceConfig("../conf/appConfig.yaml")
	fmt.Println(tc)
}