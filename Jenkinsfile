node {
    
    def commit_id
    def repo_name = "newb1e/node-counter"
    def docker_name = "newb1e-node-counter"
    stage('Preparation') {
        checkout scm
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id').trim()
        }

    stage ('Build/Push') {
       //def app = docker.build("node-counter:${env.BUILD_ID}")
       docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
           def app = docker.build("${repo_name}:${commit_id}", '.').push()
        }
    }

    stage ('Test') {
        sh "echo test complete"
        //docker.image("node-counter:${env.BUILD_ID}").withRun('-p 80:1080 -d'){ c ->
        //sh 'pm2 start app/counter-service.js'
        }
    stage ('Deploy to Prod') {
        /*
        def docker_run
        sh "docker_run=`docker ps -q -f name=${docker_name}`"
        if (docker_run != null) {
            sh "docker stop ${docker_name}"
        } 
        else {
            sh "docker run -p 80:1080 -d --rm --name ${docker_name} ${repo_name}:${commit_id}"
        }
        */
        sh "sudo chmod +x deploy-to-prod.sh"
        sh "./deploy-to-prod.sh ${docker_name} ${repo_name} ${commit_id}"
        sh "echo hello to PROD"
    }

    stage ('Cleanup') {
        sh "docker rmi ${repo_name}:latest"
    }
}