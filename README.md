# helm install
helm install example ./webapp-backend --set dbUser=team,dbPassword=<dbPassword>,imageCredentials.registry=webapp-backend:ec188de2fe4ca01d41a8f19fbe48a00c82444f72,imageCredentials.username=suhas1602,imageCredentials.password=<docker_hub_password>,rdsEndpoint=csye7374-db.cqbcoqyivrty.us-east-1.rds.amazonaws.com,dockerImage=suhas1602/webapp-backend:ec188de2fe4ca01d41a8f19fbe48a00c82444f72


# run with --dry-run flag set

helm install --dry-run --debug example ./webapp-backend --set dbUser=team,dbPassword=<dbPassword>,imageCredentials.registry=https://index.docker.io/v1/,imageCredentials.username=suhas1602,imageCredentials.password=<docker_hub_password>,rdsEndpoint=csye7374-db.cqbcoqyivrty.us-east-1.rds.amazonaws.com,dockerImage=suhas1602/webapp-backend:ec188de2fe4ca01d41a8f19fbe48a00c82444f72

