# helm install
helm install example ./webapp-backend --set dbUser=team,dbPassword=,imageCredentials.username=suhas1602,imageCredentials.password=,rdsEndpoint=csye7374-db.cqbcoqyivrty.us-east-1.rds.amazonaws.com,dockerImage=suhas1602/webapp-backend:ec188de2fe4ca01d41a8f19fbe48a00c82444f72,s3Bucket=webapp.suhaspasricha.com,awsAccess=,awsSecret=,imageCredentials.registry=https://index.docker.io/v1/


# run with --dry-run flag set

helm install --dry-run --debug example ./webapp-backend --set dbUser=team,dbPassword=,imageCredentials.username=suhas1602,imageCredentials.password=,rdsEndpoint=csye7374-db.cqbcoqyivrty.us-east-1.rds.amazonaws.com,dockerImage=suhas1602/webapp-backend:ec188de2fe4ca01d41a8f19fbe48a00c82444f72,s3Bucket=webapp.suhaspasricha.com,awsAccess=,awsSecret=,imageCredentials.registry=https://index.docker.io/v1/

