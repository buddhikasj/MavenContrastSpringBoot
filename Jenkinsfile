pipeline{
  agent none
/*  tools {
    Maven 'Maven'
  }*/
  stages{
    stage('Checkout') {
      agent any
      steps {
                echo 'Checkout..'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Contrast-Security-OSS/vulnerable-spring-boot-application.git']]])
                sh "pwd"
                 sh "ls -lat"
            }
        }
    
    stage('Compile Code') {
      agent { docker 'maven:3-alpine' }
      steps {
              sh 'mvn --version'
              sh "ls -lat"
              sh 'mvn install'
            }
        }
  }
  

}
