node {
    checkout scm
    stage ('Build') {
        def app = docker.build("node-counter:${env.BUILD_ID}")
    }
    stage ('Deploy') {
        def app = docker.image('node-counter:${env.BUILD_ID}')
        app.withRun('-p 80:1080 -d --rm --name counter-service')
    }
}