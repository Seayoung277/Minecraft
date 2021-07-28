pipeline {
  agent any
  stages {
    stage('Build 1.16') {
      steps {
        sh '''mkdir ./Spigot/1.16/build
cd ./Spigot/1.16/build
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
/usr/lib/jvm/jdk-16.0.2/bin/java -jar BuildTools.jar --rev 1.16.5
cp ./spigot-1.16.5.jar ../server.jar'''
      }
    }

    stage('') {
      steps {
        sh '''mkdir ./Spigot/1.17/build
cd ./Spigot/1.17/build
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
/usr/lib/jvm/jdk-16.0.2/bin/java -jar BuildTools.jar --rev 1.17.1
cp ./spigot-1.17.1.jar ../server.jar'''
      }
    }

  }
}