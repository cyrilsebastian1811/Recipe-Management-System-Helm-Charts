# Team information

| Team Members        | Github Id            | NUID      |
| ------------------- |:--------------------:|:---------:|
| Suhas Pasricha      | suhas1602            | 001434745 |
| Puneet Tanwar       | puneetneu            | 001409671 |
| Cyril Sebastian     | cyrilsebastian1811   | 001448384 |
| Shubham Sharma      | shubh1646            | 001447366 |

# Description

This is a repository to store helm charts that deploy the backend and frontend of our application on a kubernetes cluster.

## Backend chart 
### install
helm install backend ./webapp-backend -n api --set dbUser=team,dbPassword=Qwerty123,imageCredentials.username=<docker_hub_user_name>,imageCredentials.password=<docker_hub_password>,rdsEndpoint=<rds_endpoint>,dockerImage=<docker_hub_user_name>/<repository>:<tag>,s3Bucket=<s3_bucket_name>,awsAccess=<access_key>,awsSecret=<secret_key>,redis.global.redis.password=Yhbvft123@,domainName=<domain_name>

### uninstall
helm uninstall backend -n api


## Frontend chart 
### install
helm install frontend ./webapp-frontend -n ui --set imageCredentials.username=<docker_hub_user_name>,imageCredentials.password=<docker_hub_password>,internalBackendService=lb-backend.api,dockerImage=<docker_hub_user_name>/<repository>:<tag>,backendServiceEndpoint=<backend_url>,domainName=<domain_name>

### uninstall
helm uninstall frontend -n ui


## Goapp chart
### install
helm install goapp ./webapp-goapp -n time --set imageCredentials.username=<docker_hub_user_name>,imageCredentials.password=<docker_hub_password>,dockerImage=<docker_hub_user_name>/<repository>:<tag>,domainName=<domain_name>

### uninstall
helm delete goapp -n time


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
6. DOMAIN_NAME --> dev.cyril-sebastian.com
#### Password Parameters
3. AWS_ACCESS_KEY_ID --> xxxxxxxxxxxxxxx
4. AWS_SECRET_ACCESS_KEY --> xxxxxxxxxxxxxxx
5. REDIS_PSW --> Yhbvft123@