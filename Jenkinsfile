pipeline {
  agent any
  stages {
    stage('Backup') {
      steps {
        sh '''if [[ ! -z "$(lsof -t -i :25565)" ]] ; then
kill $(lsof -t -i :25566)
fi
if [[ ! -z "$(lsof -t -i :25566)" ]] ; then
kill $(lsof -t -i :25566)
fi
if [[ ! -z "$(lsof -t -i :25567)" ]] ; then
kill $(lsof -t -i :25567)
fi
cp -r ./Spigot/1.16/worl* /home/seayoung/Minecraft/FileStore/1.16/
cp -r ./Spigot/1.17/worl* /home/seayoung/Minecraft/FileStore/1.17/'''
      }
    }
    stage('Build 1.16') {
      steps {
        sh '''mkdir -p ./Spigot/1.16/build
cd ./Spigot/1.16/build
rm -f BuildTools.jar
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
/usr/lib/jvm/jdk-16.0.2/bin/java -jar BuildTools.jar --rev 1.16.5
cp ./spigot-1.16.5.jar ../server.jar'''
      }
    }

    stage('Build 1.17') {
      steps {
        sh '''mkdir -p ./Spigot/1.17/build
cd ./Spigot/1.17/build
rm -f BuildTools.jar
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
/usr/lib/jvm/jdk-16.0.2/bin/java -jar BuildTools.jar --rev 1.17.1
cp ./spigot-1.17.1.jar ../server.jar'''
      }
    }

    stage('Start BungeeCord') {
      steps {
        sh '''cd ./BungeeCord
rm -f BungeeCord.jar
wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
JENKINS_NODE_COOKIE=dontKillMe nohup bash start.sh &'''
      }
    }

    stage('Start 1.16') {
      steps {
        sh '''cd ./Spigot/1.16
//rm -f ./plugins/CoreProtect/database.db
//rm -rf ./worl*
//cp /home/seayoung/Minecraft/FileStore/1.16/database.db ./plugins/CoreProtect/
//cp -r /home/seayoung/Minecraft/FileStore/1.16/worl* ./
JENKINS_NODE_COOKIE=dontKillMe nohup bash start.sh &'''
      }
    }

    stage('Start 1.17') {
      steps {
        sh '''cd ./Spigot/1.17
//rm -rf ./worl*
//cp -r /home/seayoung/Minecraft/FileStore/1.17/worl* ./
JENKINS_NODE_COOKIE=dontKillMe nohup bash start.sh &'''
      }
    }
    stage('Push Changes') {
      steps {
        sh '''git add . && git commit -m \'Back up\'
git push'''
      }
    }
  }
}
