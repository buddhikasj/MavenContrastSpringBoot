pipeline{
  agent none
  environment {
    registryCredential = 'docker-hub'
  }
  stages{
    stage('Checkout') {
      agent any
      steps {
                echo 'Checkout..'
                sh "mkdir -p code"
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'code']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/buddhikasj/contrastspringboot_code.git']]])
                sh "pwd"
                sh "ls -lat"
            }
        }
    
    stage('Compile Code') {
      agent { docker {
                image 'maven:3.6-alpine'
                args '-v $HOME/.m2:/root/.m2'
                } 
             }
      steps {
              sh 'mvn --version'
              sh 'cd code'
              sh "ls -lat"
      //        sh "mvn -f code clean test"
              sh "mvn -f code install \
                  -DCONTRAST_MAVEN_USERNAME=agent_0b86fa1b-36a8-4e0b-b9e1-59004016c595@KabithasOrg \
                  -DCONTRAST_MAVEN_ORGUUID=1111 \
                  -DCONTRAST_MAVEN_TEAMSERVERURL=https://ce.contrastsecurity.com/Contrast \
                  -DCONTRAST_MAVEN_APIKEY=NjjyC0AnX16zil19l90iwdiI7BUj6U1l \
                  -DCONTRAST_MAVEN_SERVICEKEY=67WSSFEL0RUZBZKA \
                  -P run-with-contrast" 
        // -Dmaven.test.skip=true'
            }
        }
      stage('Building Image') {
         steps{
            script {
                  customImage = docker.build("buddhikasj88/contrast-springboot:${env.BUILD_ID}")

            }
          }
        }
       stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        customImage.push()
                        customImage.push('latest')
                    }
                }
            }
  }
  

}
}
