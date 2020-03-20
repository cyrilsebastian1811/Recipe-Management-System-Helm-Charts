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
helm install example ./webapp-backend -n api --set namespace=api,dbUser=team,dbPassword=,imageCredentials.username=suhas1602,imageCredentials.password=,rdsEndpoint=csye7374-db.cqbcoqyivrty.us-east-1.rds.amazonaws.com,dockerImage=suhas1602/webapp-backend:dev3,s3Bucket=webapp.suhaspasricha.com,awsAccess=,awsSecret=,redis.global.redis.password=,imageCredentials.registry=https://index.docker.io/v1/


# To uninstall chart
helm uninstall example -n api


# Frontend chart
helm install example2 ./webapp-frontend -n ui --set namespace=ui,imageCredentials.username=suhas1602,imageCredentials.password=,internalBackendService=backendlb-example.api,dockerImage=suhas1602/webapp-frontend:2a1e4eb5d195682b40d85d78b8d8085d2b351561,backendServiceEndpoint=http://a510804d8cb74426d960b71c9faccc01-1367718300.us-east-1.elb.amazonaws.com:3000,imageCredentials.registry=https://index.docker.io/v1/


## Jenkins

### Plugins to be Installed
1. GitHub Integration
2. Kubernetes CLI
3. Kubernetes
4. SSH Agent
5. Generic Webhook Trigger

### Global Credentials
1. dockerhub_credentials(type: Username and Password) --> Username: cyrilsebastian1811, Password: xxxxxxxxxx
2. db_credentials(type: Username and Password) --> Username: team, Password: Qwerty123
2. github-ssh(SSH) --> Username: github, Private Key(contents of cyril_work from local)
3. kubernetes_credentials(Username and Password) --> Username: admin, Password: (~/.kube/config/users:password | base64 )

#### Configure System
1. Manage Jenkins -> Configure System -> Cloud -> Kubernetes:
```
Kubernetes server certificate key: (~/.kube/config/clusters:certificate-authority-data | base64decode )
Credentials: kubernetes_credentials
```
2. Manage Jenkins -> Configure System -> Git plugin:
```
Global Config user.name Value: Jenkins
```

### Configuration for Pipeline
#### Build Triggers
1. Generic Webhook Trigger:
```
Token: QAZwsx123>
```
#### Strig Parameters
1. GIT_URL --> git@github.com:cyrilsebastian1811/webapp-backend.git
2. GIT_BRANCH --> a8
3. S3_BUCKET_URL --> webapp.dev.cyril-sebastian.com
4. RDS_ENDPOINT --> csye7374-db.cz6rkkjdva3j.us-east-1.rds.amazonaws.com
5. KUBERNETES_API --> https://api.k8.dev.cyril-sebastian.com
#### Password Parameters
3. AWS_ACCESS_KEY_ID --> xxxxxxxxxxxxxxx
4. AWS_SECRET_ACCESS_KEY --> xxxxxxxxxxxxxxx
5. REDIS_PSW --> Yhbvft123@