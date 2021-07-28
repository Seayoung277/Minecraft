pipeline {
  agent any
  stages {
    stage('Build 1.16') {
      steps {
        sh '''mkdir ./Spigot/1.16/build
cd ./Spigot/1.16/build
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar'''
      }
    }

  }
}