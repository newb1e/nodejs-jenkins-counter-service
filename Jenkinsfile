node {
    checkout scm
    stage ('Build') {
        def app = docker.build(node-counter, ".")
    }
    stage ('Deploy') {
        sh 'docker container rm counter-service'
        docker.image('node-counter:latest').withRun('-p 80:1080 -d --rm --name counter-service')
    }
}