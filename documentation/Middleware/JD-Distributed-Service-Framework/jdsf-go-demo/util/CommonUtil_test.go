package util

import (
	"fmt"
	"testing"
)

func TestGetServerLocalIp(t *testing.T) {
	ipAddress := GetServerLocalIp();

	fmt.Println(ipAddress)
}