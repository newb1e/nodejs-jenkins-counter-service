node(label: 'builder') {
    def commit_id
    def repo_name = "newb1e/node-counter"
    def docker_name = "newb1e-node-counter"
    
    stage('Preparation') {
        checkout scm
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id').trim()
        }

    stage ('Build/Push') {
       docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
           def app = docker.build("${repo_name}:${commit_id}", '.').push()
        }
    }

    stage ('Test') {
        sh "echo test started"
        sh "echo test completed"
    }

    stage ('Deploy to Prod') {
        sh "chmod +x deploy-to-prod.sh"
    // The script starts a container named newb1e-node-counter.
    // If already running, container is stopped and being ran again.
        sh "./deploy-to-prod.sh ${docker_name} ${repo_name} ${commit_id}"
        sh "echo hello to PROD"
    }

    stage ('Cleanup') {
        sh "echo cleanup starting..."
        sh "docker image prune -af"
        sh "echo cleanup finished."
    }
}