// Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    options {
        skipDefaultCheckout(true)
    }
    environment {
        // Srting Parameters
        GIT_URL = "${env.GIT_URL}"
        GIT_BRANCH = "${env.GIT_BRANCH}"
        S3_BUCKET_URL = "${env.S3_BUCKET_URL}"
        RDS_ENDPOINT = "${env.RDS_ENDPOINT}"
        KUBERNETES_API = "${env.KUBERNETES_API}"

        // Password Parameters
        AWS_ACCESS_KEY_ID = "${env.AWS_ACCESS_KEY_ID}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_SECRET_ACCESS_KEY}"
        REDIS_PSW = "${env.REDIS_PSW}"

        // common parameters
        DOCKERHUB_CREDENTIALS = credentials('dockerhub_credentials')
        DB_CREDENTIALS = credentials('db_credentials')

        // Default Parameters
        git_commit = null
        git_message = null
        scope = null
    }
    stages {
        stage('Checkout helm-charts') { 
            steps {
                script {
                    git_info = git branch: "${GIT_BRANCH}", credentialsId: "github-ssh", url: "${GIT_URL}"
                    git_commit = "${git_info.GIT_COMMIT}"
                }
            }
        }
        stage('Build Logic') {
            steps {
                script {
                    git_message = sh(returnStdout: true, script: "git log --format=%B -n 1 ${git_commit}")
                    scope = sh(returnStdout: true, script: "(echo \"$git_message\" | grep -Eq  ^.*backend.*) && echo \"backend\" || echo \"frontend\"")
                    scope = sh(returnStdout: true, script: "(echo \"$git_message\" | grep -Eq  ^.*frontend.*) && echo \"frontend\" || echo \"${scope}\"")
                    scope = scope.replaceAll("[\n\r]", "")
                }
            }
        }
        stage('Build Backend Helm Chart installation') {
            when {
                expression { scope == "backend" }
            }
            steps {
                script {
                    sh "pwd"
                    sh "ls -a"
                    withKubeConfig([credentialsId: 'kubernetes_credentials', serverUrl: "${KUBERNETES_API}"]) {
                        sh "helm version"
                        sh "helm dependency update ./webapp-backend"
                        sh("helm upgrade backend ./webapp-backend -n api --install --wait --set dbUser=${DB_CREDENTIALS_USR},dbPassword=${DB_CREDENTIALS_PSW},imageCredentials.username=${DOCKERHUB_CREDENTIALS_USR},imageCredentials.password=${DOCKERHUB_CREDENTIALS_PSW},rdsEndpoint=${RDS_ENDPOINT},s3Bucket=${S3_BUCKET_URL},awsAccess=${AWS_ACCESS_KEY_ID},awsSecret=${AWS_SECRET_ACCESS_KEY},redis.global.redis.password=${REDIS_PSW},imageCredentials.registry=https://index.docker.io/v1/")
                    }
                }
            }
        }
        stage('Build Frontend Helm Chart installation') {
            when {
                expression { scope == "frontend" }
            }
            steps {
                script {
                    sh "pwd"
                    sh "ls -a"
                    withKubeConfig([credentialsId: 'kubernetes_credentials', serverUrl: "${KUBERNETES_API}"]) {
                        def BACKEND_ENDPOINT = sh(returnStdout: true, script: "kubectl get svc lb-backend -n api -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'")
                        sh("helm upgrade frontend ./webapp-frontend -n ui --install --set imageCredentials.username=${DOCKERHUB_CREDENTIALS_USR},imageCredentials.password=${DOCKERHUB_CREDENTIALS_PSW},internalBackendService=lb-backend.api,backendServiceEndpoint=${BACKEND_ENDPOINT},imageCredentials.registry=https://index.docker.io/v1/")
                    }
                }
            }
        }
    }
}