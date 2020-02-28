# Team information

| Team Members        | Github Id            | NUID      |
| ------------------- |:--------------------:|:---------:|
| Suhas Pasricha      | suhas1602            | 001434745 |
| Puneet Tanwar       | puneetneu            | 001409671 |
| Cyril Sebastian     | cyrilsebastian1811   | 001448384 |
| Shubham Sharma      | shubh1646            | 001447366 |

# Description

This is a repository to store helm charts that deploy the backend and frontend of our application on a kubernetes cluster.

# To install chart
helm install example ./webapp-backend -n api --set dbUser=team,dbPassword=,imageCredentials.username=suhas1602,imageCredentials.password=,rdsEndpoint=csye7374-db.cqbcoqyivrty.us-east-1.rds.amazonaws.com,dockerImage=suhas1602/webapp-backend:dev3,s3Bucket=webapp.suhaspasricha.com,awsAccess=,awsSecret=,redis.global.redis.password=,imageCredentials.registry=https://index.docker.io/v1/

# To uninstall chart
helm uninstall example -n api


# Frontend chart
helm install example2 ./webapp-frontend -n ui --set imageCredentials.username=suhas1602,imageCredentials.password=,internalBackendService=backendlb-example.api,dockerImage=suhas1602/webapp-frontend:2a1e4eb5d195682b40d85d78b8d8085d2b351561,backendServiceEndpoint=http://a510804d8cb74426d960b71c9faccc01-1367718300.us-east-1.elb.amazonaws.com:3000,imageCredentials.registry=https://index.docker.io/v1/