node {
    
    def commit_id
    stage('Preparation') {
        checkout scm
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id').trim()
        }

    stage ('Build/Push') {
       //def app = docker.build("node-counter:${env.BUILD_ID}")
       docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
       def app = docker.build("newb1e/node-counter:${commit_id}", '.').push()
    }

    stage ('Deploy') {
        sh "docker run -p 80:1080 -d --rm newb1e/node-counter:${commit_id}""
        //docker.image("node-counter:${env.BUILD_ID}").withRun('-p 80:1080 -d'){ c ->
        //sh 'pm2 start app/counter-service.js'
        }
    }
}