# demo-application
Demo application

Build this application using command -
    
    docker build -t my-go-app .

Run this application using below command -

    docker run -p 8080:8081 -it my-go-app

or in detached mode

    docker run -p 8080:8081 -d my-go-app

Awesome, if we open up http://localhost:8080 within our browser, we should see that our application is successfully responding with Hello, "/".    