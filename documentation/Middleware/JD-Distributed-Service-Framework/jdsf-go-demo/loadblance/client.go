package loadblance

import (
	"context"
	"fmt"
	"github.com/hashicorp/consul/api"
	"github.com/opentracing/opentracing-go"
	"go-consul-demo/config"
	"go-consul-demo/opentrace"
	"io"
	"math/rand"
	"net/http"
	"regexp"
	"strconv"
	"strings"
	"time"
)

func Get(url string,context context.Context,options ...opentrace.ClientOption) (*http.Response,error)  {

	client := &http.Client{Transport: &opentrace.Transport{}}
	req,err,ht := LBRequest("get",url,nil,context,options...)
	if err != nil{
		return nil,err
	}
	defer ht.Finish()
	return client.Do(req)
}

func post(url string, contentType string, body io.Reader,context context.Context,options ...opentrace.ClientOption)  {

}

func LBRequest(method, url string, body io.Reader,context context.Context,options ...opentrace.ClientOption) (*http.Request,error,*opentrace.Tracer) {
	req ,err := http.NewRequest(method,url,body)

	var tr opentracing.Tracer
	var span opentracing.Span
	traceConfig :=	config.GetTraceConfig("./conf/appConfig.yaml")
	if traceConfig.Enable{
		if context != nil{
			span =	opentracing.SpanFromContext(context)
			tr = span.Tracer()
		}else{
			tr = opentracing.GlobalTracer()
		}
		if span !=nil{
			req = req.WithContext(opentracing.ContextWithSpan(req.Context(),span))
		}
	}
	client := GetConsulClient()
	if client == nil{
		return nil,err,nil
	}
	serviceName := ""
	serviceNameAndPort := req.URL.Host

	serviceNameAndPortArray := strings.Split(serviceNameAndPort,":")

	if len(serviceNameAndPortArray)>0 {
		serviceName = serviceNameAndPortArray[0]
	}

 	isMatch,err := regexp.MatchString("((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))",serviceName)
	if isMatch{
		if traceConfig.Enable{
			req,ht :=opentrace.TraceRequest(tr,req,options...)
			return req,err,ht
		}else{
			return req,err,nil
		}
	}

	serviceEntry, _ ,err :=client.Health().Service(serviceName,"",true,nil)

	if err != nil{
		fmt.Println(err)
		if traceConfig.Enable{

			req,ht :=opentrace.TraceRequest(tr,req,options...)
			return req,err,ht
		}else{
			return req,err,nil
		}
	}
	if len(serviceEntry) ==0{
		fmt.Println("not found service name is ",serviceName)
		if traceConfig.Enable{
			req,ht :=opentrace.TraceRequest(tr,req,options...)
			return req,err,ht
		}else{
			return req,err,nil
		}
	}
	service := new(api.ServiceEntry)
	if len(serviceEntry) >0{
		rand.Seed(time.Now().UnixNano())
		serviceInstanceCount := len(serviceEntry)
		serviceIndex := rand.Intn(serviceInstanceCount)
		service = serviceEntry[serviceIndex]

	}
	if service.Service != nil {
		requestFinalHost := service.Service.Address+":"+strconv.Itoa(service.Service.Port)
		req.URL.Host = requestFinalHost
		req.Host = requestFinalHost
		if err != nil {
			fmt.Println(err)
			if traceConfig.Enable {
				req,ht :=opentrace.TraceRequest(tr,req,options...)
				return req,err,ht
			}else{
				return req,err,nil
			}
		}

		if traceConfig.Enable{
			req,ht :=opentrace.TraceRequest(tr,req,options...)
			return req,err,ht
		}else{
			return req,err,nil
		}
	}
	if traceConfig.Enable{
		req,ht :=opentrace.TraceRequest(tr,req,options...)
		return req,err,ht
	}else{
		return req,err,nil
	}
}



