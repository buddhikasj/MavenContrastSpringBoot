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
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'code']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Contrast-Security-OSS/vulnerable-spring-boot-application.git']]])
                sh "pwd"
                sh "ls -lat"
            }
        }
    
    stage('Compile Code') {
      agent { docker {
                image 'maven:3-alpine'
                args '-v $HOME/.m2:/root/.m2'
                } 
             }
      steps {
              sh 'mvn --version'
              sh 'cd code'
              sh "ls -lat"
              sh 'mvn -f code install -Dmaven.test.skip=true'
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
