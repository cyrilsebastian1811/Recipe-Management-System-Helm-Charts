// Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    options {
        skipDefaultCheckout(true)
    }
    environment {
        git_hash = null
        GIT_URL = "${env.GIT_URL}"
        S3_BUCKET_URL = "${env.S3_BUCKET_URL}"
        RDS_ENDPOINT = "${env.RDS_ENDPOINT}"
        // BACKEND_ENDPOINT = "${env.BACKEND_ENDPOINT}"
        AWS_ACCESS_KEY_ID = "${env.AWS_ACCESS_KEY_ID}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_SECRET_ACCESS_KEY}"
        REDIS_PSW = "${env.REDIS_PSW}"
        DB_CREDENTIALS = credentials('db_credentials')
        // DOCKERHUB_CREDENTIALS = credentials('dockerhub_credentials')


        // backend parameters
        S3_BUCKET_URL = "${env.S3_BUCKET_URL}"
        RDS_ENDPOINT = "${env.RDS_ENDPOINT}"
        AWS_ACCESS_KEY_ID = "${env.AWS_ACCESS_KEY_ID}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_SECRET_ACCESS_KEY}"
        REDIS_PSW = "${env.REDIS_PSW}"
        DB_CREDENTIALS = credentials('db_credentials')

        // frontend parameters
        BACKEND_ENDPOINT = "${env.BACKEND_ENDPOINT}"


        // common parameters
        DOCKERHUB_CREDENTIALS = credentials('dockerhub_credentials')
    }
    stages {
        stage('Checkout helm-charts') { 
            steps {
                script {
                    git_info = checkout([
                        $class: 'GitSCM', branches: [[name: "*/${env.GIT_BRANCH}"]], 
                        doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], 
                        userRemoteConfigs: [[
                            credentialsId: 'GitToken', 
                            url: "${GIT_URL}"
                        ]]
                    ])

                    git_hash = "${git_info.GIT_COMMIT[0..6]}"
                }

                echo "${git_hash}"
            }
        }
        stage('Build Backend Helm Chart installation') {
            steps {
                script {
                    sh "pwd"
                    sh "ls -a"
                    sh "helm upgrade backend ./webapp-backend -n api --install --set dbUser=${DB_CREDENTIALS_USR},dbPassword=${DB_CREDENTIALS_PSW},imageCredentials.username=${DOCKERHUB_CREDENTIALS_USR},imageCredentials.password=${DOCKERHUB_CREDENTIALS_PSW},rdsEndpoint=${RDS_ENDPOINT},s3Bucket=${S3_BUCKET_URL},awsAccess=${AWS_ACCESS_KEY_ID},awsSecret=${AWS_SECRET_ACCESS_KEY},redis.global.redis.password=${REDIS_PSW},imageCredentials.registry=https://index.docker.io/v1/"
                }
            }
        }
        // stage('Build Frontend Helm Chart installation') {
        //     steps {
        //         script {
        //             sh "pwd"
        //             sh "ls -a"
        //             sh "helm upgrade frontend ./webapp-frontend -n ui --install --set imageCredentials.username=${DOCKERHUB_CREDENTIALS_USR},imageCredentials.password=${DOCKERHUB_CREDENTIALS_PSW},internalBackendService=lb-backend.api,backendServiceEndpoint=${BACKEND_ENDPOINT},imageCredentials.registry=https://index.docker.io/v1/"
        //         }
        //     }
        // }
    }
}