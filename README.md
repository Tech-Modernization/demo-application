# Demo Application
Demo application

Build this application in your local env using command -
    
    docker build -t my-go-app .

Run this application using below command -

    docker run -p 8080:8081 -it my-go-app

or in detached mode

    docker run -p 8080:8081 -d my-go-app

Awesome, if we open up http://localhost:8080 within our browser, we should see that our application is successfully responding with Hello, "/".  


## Getting started
To run it in cloud, k8s is used and few required objects in the cluster are created as mentioned below.

1) certificate
2) ingress
3) deployment
4) service
5) service-account

### Steps to run this on cloud

Note - Infra for this application to run is created in https://github.com/contino/demo-infra-gcp

1) Create below mentioned env variables in CircleCi with respective values

        CLUSTER_NAME = demo-application
        CLUSTER_REGION = europe-west1
        GCP_CREDS = <cicd-pipeline serviceaccount json key data>
        GCP_PROJECT = jagendra-atal-prakash-contino
        IMAGE_NAME = demo-application

2) deployment.yaml file is the only place where 2 variables (IMAGE & VERSION) have to be substituted which is done already in pipeline as given below

        cat k8s/*.yaml | envsubst | kubectl apply -f -
         
### TODO

1) Create multi-tenant environment using seperate namespace and move application to spicific namespace

2) Introduce podsecuritypolicy to achieve least privelage best practice

3) Introduce securitycontext and container must not run as root

4) Introduce Horizontal Pod Autoscaler/Vertical Pod Autoscaler accordingly

5) Introduce LimitRange for deployments

6) Review "Smoke test" step in pipeline and improve that accordingly
