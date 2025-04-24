node {
    stage('SCM Checkout') {
        git 'https://github.com/ghost-00007/my-app.git'
    }

    stage('Build Docker Image') {
        sh 'docker build -t noblerex/myapp:latest .'
    }

    stage('Docker Image Push') {
        withCredentials([string(credentialsId: 'dockerPass', variable: 'dockerPassword')]) {
            sh 'echo "$dockerPassword" | docker login -u noblerex --password-stdin'
        }
        sh 'docker push noblerex/myapp:latest'
    }

    stage('Remove Previous Container') {
        script {
            try {
                sh 'docker rm -f webserver'
            } catch (err) {
                echo "No existing container to remove."
            }
        }
    }

    stage('Docker Deployment') {
        sh 'docker run -d -p 80:80 --name webserver noblerex/myapp:latest'
    }
}
