def pipelineContext = [:]
node {
    def registryProjet='registry.gitlab.com/alioune3112/container-registry'
    def IMAGE="${registryProjet}:version-${env.BUILD_ID}"
    echo "IMAGE = $IMAGE"
    stage('Clone'){
        git 'https://github.com/Alzo98/jenkins-build-docker.git'
    }
    
    def img = stage('Build'){
        docker.build("$IMAGE", '.')
    }
    stage('Run'){
        img.withRun("--name run-$BUILD_ID -p 8081:80"){ c ->
            sh 'curl localhost:8081'
        }
    }
    
    stage('Push'){
        docker.withRegistry('https://registry.gitlab.com', 'reg1'){
            img.push 'latest'
            img.push()
        }
    }
}
