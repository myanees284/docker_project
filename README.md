# docker_project - this is simple hello world kind of demo done using docker and kubernetes to run on IBM cloud
# Steps to Run
1) Clone the repository
2) Run the dockerfile
    2.1) This file builds the source code using maven and starts the application on port 2123(local)
3) RunJob.sh - 
  3.1) Login into docker and the push the built image(step 2) into docker.
  3.2) Logs into the ibmcloud and setup the classpath(KUBECONFIG) on mycluster
  3.3) Checks if the deployment with name hellosample already exist.If its available, deployement simply updates the container with new changes. If the deployemnt is not there, a new deployment with name hellosample is created
3) Sample_Deployment.yml - deployment file
4) exposeservice.yml - exposising the application using nodeport on 31036 port.
5) On successful deployment, application will be accesible on http://<hostname>:31036/status
