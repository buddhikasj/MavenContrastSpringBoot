pipeline{
  agent any
  tools {
    maven 'Maven 3.3.9'
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
