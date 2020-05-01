# demo-application
Demo application

Build this application in your local env using command -
    
    docker build -t my-go-app .

Run this application using below command -

    docker run -p 8080:8081 -it my-go-app

or in detached mode

    docker run -p 8080:8081 -d my-go-app

Awesome, if we open up http://localhost:8080 within our browser, we should see that our application is successfully responding with Hello, "/".  



To run it in cloud, k8s is used and few required objects in the cluster are created as mentioned below.

1) cert-manager
2) certificate
3) ingress-controller
4) ingress
5) lets-encrypt
6) application deployment & service

**Steps to run this on cloud**

1) Create below mentioned env variables in CircleCi with respective values

    CLUSTER_NAME = demo-application
    CLUSTER_REGION = europe-west1
    GCP_CREDS = <jagendra-atal-prakash-contino-b9e4ac7fe2dc.json file contents>
    GCP_PROJECT = jagendra-atal-prakash-contino
    IMAGE_NAME = demo-application
        
        
2) Create secret using container registry service account
   
   kubectl create secret docker-registry gcr-json-key --docker-server=eu.gcr.io --docker-username=_json_key --docker-password="$(cat /Users/japrakash/Downloads/jagendra-atal-prakash-contino-b9e4ac7fe2dc.json)"


        
