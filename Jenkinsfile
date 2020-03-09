#!groovy
import groovy.json.JsonSlurperClassic
node
 {
    
    stage('checkout source')
     {
         def BUILD_NUMBER=env.BUILD_NUMBER
    def RUN_ARTIFACT_DIR="tests/${BUILD_NUMBER}"
    def SFDC_USERNAME
    def HUB_ORG=env.HUB_ORG_DH
    def SFDC_HOST = env.SFDC_HOST_DH
    def JWT_KEY_CRED_ID = env.JWT_CRED_ID_DH
    def CONNECTED_APP_CONSUMER_KEY=env.CONNECTED_APP_CONSUMER_KEY_DH
    def toolbelt = tool 'toolbelt
        // when running in multi-branch job, one must issue this command
        checkout scm
    }

    withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: 'jwt_key_file')])
     {
        stage('Need to authorize')
         {
                echo BUILD_NUMBER
                echo RUN_ARTIFACT_DIR
                echo CONNECTED_APP_CONSUMER_KEY_DH
                echo HUB_ORG_DH
                echo JWT_CRED_ID_DH
                echo SFDC_HOST_DH
            rc = sh returnStatus: true, script:"${toolbelt}/sfdx force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --jwtkeyfile ${jwt_key_file} --username ${HUB_ORG} --instanceurl ${SFDC_HOST} --setdefaultdevhubusername"
            if (rc != 0)
             { error 'hub org authorization failed' }

            // need to pull out assigned username
           /* rmsg = sh returnStdout: true, script: "${toolbelt}/sfdx force:org:create --definitionfile config/project-scratch-def.json --json --setdefaultusername"
            printf rmsg
            def jsonSlurper = new JsonSlurperClassic()
            def robj = jsonSlurper.parseText(rmsg)
            if (robj.status != 0)
             {
                  error 'org creation failed: ' + robj.message
             }
            SFDC_USERNAME=robj.result.username
            robj = null
*/
        }

        stage('Push To Test Org')
         {
            rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:source:push --targetusername ${SFDC_USERNAME}"
            if (rc != 0)
             {
                error 'push failed'
            }
            // assign permset
            rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:user:permset:assign --targetusername ${SFDC_USERNAME} --permsetname DreamHouse"
            if (rc != 0)
             {
                error 'permset:assign failed'
            }
        }
     }
 }