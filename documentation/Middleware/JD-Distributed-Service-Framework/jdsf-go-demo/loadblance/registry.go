package loadblance

import (
	"fmt"
	"github.com/hashicorp/consul/api"
	"go-consul-demo/config"
	"strconv"
)

func GetConsulClient() *api.Client  {
	consulConfig :=config.GetConsulConfig("./conf/appConfig.yaml")

	config := api.DefaultConfig()

	consulPortStr := strconv.Itoa(int(consulConfig.Port))
	config.Address = consulConfig.Address+":"+consulPortStr
	fmt.Println(config.Address)
	config.Scheme = consulConfig.Scheme
	client, err := api.NewClient(config)
	if err != nil{
		fmt.Println(err)
		return nil
	}
	return client;
}

func RegistryService()  {
	appConfig :=config.GetAppConfig("./conf/appConfig.yaml")
	portStr :=  strconv.Itoa(appConfig.ServerPort)
	client :=  GetConsulClient()
	if client == nil{
		return
	}
	agentService :=	new(api.AgentServiceRegistration)
	agentService.Port = appConfig.ServerPort
	agentService.Address = appConfig.HostIp
	agentService.Kind = ""
	agentService.Name = appConfig.AppName
	agentService.ID = appConfig.InstanceId

	agentCheck :=new(api.AgentServiceCheck)
	agentCheck.Name =  appConfig.AppName
	agentCheck.CheckID = appConfig.InstanceId
	agentCheck.HTTP = "http://"+appConfig.HostIp+":"+portStr+appConfig.CheckUrl
	agentCheck.Method = "GET"
	agentCheck.Interval= "30s"
	agentService.Check = agentCheck
	regErr:=client.Agent().ServiceRegister(agentService)
	if regErr!=nil{
		fmt.Println(regErr)
	}
}