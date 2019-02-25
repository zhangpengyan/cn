package main

import (
	"fmt"
	"go-consul-demo/loadblance"
	"go-consul-demo/opentrace"
	"go-consul-demo/service"
)

func main()  {
	fmt.Println("hello world!")
    loadblance.RegistryService()
	opentrace.AppTraceGlobalConfig()
	service.StartWebServer()

}
