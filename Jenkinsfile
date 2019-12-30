pipeline{
  agent none
/*  tools {
    Maven 'Maven'
  }*/
  stages{
    agent any
    stage('Checkout') {
      steps {
                echo 'Checkout..'

                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Contrast-Security-OSS/vulnerable-spring-boot-application.git']]])
            }
        }
    
    stage('Compile Code') {
      agent { docker 'maven:3-alpine' }
      steps {
              sh 'mvn --version'
              sh 'mvn install'
            }
        }
  }
  

}
