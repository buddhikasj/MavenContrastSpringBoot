pipeline{
  agent any
  tools {
    Maven 'Maven 3.6.2'
  }
  stages{
    stage('Checkout') {
      steps {
                echo 'Checkout..'

                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Contrast-Security-OSS/vulnerable-spring-boot-application.git']]])
            }
        }
    
    stage('Build') {
            steps {
                sh 'mvn install'
            }
        }
  }
  

}
