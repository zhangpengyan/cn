package service

import (
	"github.com/opentracing/opentracing-go"
	"go-consul-demo/config"
	"go-consul-demo/opentrace"
	"log"
	"net/http"
	"strconv"
)

func StartWebServer()  {
	appConfig :=config.GetAppConfig("./conf/appConfig.yaml")
	traceConfig := config.GetTraceConfig("./conf/appConfig.yaml")
	r := NewRouter()
	http.Handle("/", r)
	println(appConfig.ServerPort)
	portStr := strconv.Itoa(appConfig.ServerPort)
	log.Println("Starting HTTP service at " + portStr)
	var err error
	if traceConfig.Enable{
		err = http.ListenAndServe(":" + portStr,opentrace.Middleware(opentracing.GlobalTracer(),http.DefaultServeMux))
	}else{
		err = http.ListenAndServe(":" + portStr,nil)
	}

	if err != nil {
		log.Println("An error occured starting HTTP listener at port " + portStr)
		log.Println("Error: " + err.Error())
	}
}