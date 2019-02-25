package service

import (
	"fmt"
	"github.com/opentracing/opentracing-go"
	"go-consul-demo/loadblance"
	"go-consul-demo/opentrace"
	"io/ioutil"
	"net/http"
)

func RegistryCheck(w http.ResponseWriter, r *http.Request)  {
	t1 :=opentracing.GlobalTracer()
	fmt.Println(t1)
	paramMap := make(map[string]string)

	paramMap["gameid"] = "123123"


	t :=opentracing.GlobalTracer()
	fmt.Println(t)
	req ,err, ht :=	loadblance.LBRequest("GET","http://db-service:8090/db/gameinfo/getgameinfo?gameid=123123",nil,r.Context())
	 if err!= nil{
	 	fmt.Println(err)
	 }

	client := &http.Client{Transport: &opentrace.Transport{}}
	t2 :=opentracing.GlobalTracer()
	fmt.Println(t2)
	resp, err := client.Do(req)
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Println(err)
	}
	defer ht.Finish()
	writeJsonResponse(w, http.StatusOK, body)
}