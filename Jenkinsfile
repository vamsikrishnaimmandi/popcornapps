pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        echo CONNECTED_APP_CONSUMER_KEY_DH
                echo HUB_ORG_DH
                echo JWT_CRED_ID_DH
                echo SFDC_HOST_DH
        stage('Build') {
            steps {
                
                echo 'Building'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying'
            }
        }
    }
}