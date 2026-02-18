pipeline {
    agent any
    options {
        timestamps()
        ansiColor('xterm')
    }
    environment {
        MAVEN_OPTS = '-Xmx1g'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build & Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'mvn -B -DskipTests=false test'
                    } else {
                        bat 'mvn -B -DskipTests=false test'
                    }
                }
            }
        }
        stage('Archive Reports') {
            steps {
                archiveArtifacts artifacts: 'target/karate-reports/**', fingerprint: true
                archiveArtifacts artifacts: 'target/surefire-reports/**', fingerprint: true
            }
        }
    }
    post {
        always {
            script {
                if (fileExists('target/karate-reports/karate-summary.html')) {
                    publishHTML(target: [allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'target/karate-reports', reportFiles: 'karate-summary.html', reportName: 'Karate Report'])
                }
            }
        }
        failure {
            script {
                if (env.JOB_NAME) {
                    echo "Build failed: ${env.JOB_NAME} #${env.BUILD_NUMBER}"
                }
            }
        }
    }
}
