pipeline {
agent any
tools
{
    maven  'Maven3'
}
stages {
stage('start') {
steps {
echo 'This is a minimal pipeline.'

}
}
stage('fetch') {
steps {
    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'first-app', url: 'https://github.com/tulikasah689/First-App.git']]])
   // git branch: 'main', credentialsId: 'cacdd6c2-cb35-4841-9050-599f72089fbb', url: 'https://github.com/AnnaMohan/maven.git'
//git url: 'https://github.com/tulikasah689/First-App.git'
}
}
stage('complie') {
steps {

bat 'mvn clean install'

}
}
 stage('SonarQube analysis') {
           steps {
                withSonarQubeEnv('SonarQube'){
                    bat 'mvn sonar:sonar'
                }
            }

}
 checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {

        def customImage = docker.build("tulikasah689/our-web-app")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
}

