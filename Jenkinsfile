pipeline {
    agent any

    environment {
        PYTHON = "python3"
        REPO_URL = "https://github.com/snehabaravkar11/CICD.git"
        BRANCH = "main"
    }

    triggers {
        // Run on code changes (poll every 5 min)
        pollSCM('H/5 * * * *')

        // Nightly regression at 2 AM
        cron('H 2 * * *')
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: "${BRANCH}", url: "${REPO_URL}"
            }
        }

        stage('Setup Python Environment') {
            steps {
                sh '''
                ${PYTHON} -m venv venv
                . venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Smoke Tests (on commit)') {
            when {
                not {
                    triggeredBy 'TimerTrigger'
                }
            }
            steps {
                sh '''
                .venv/bin/activate
                robot --include smoke --outputdir reports tests/
                '''
            }
        }

        stage('Run Regression Tests (nightly)') {
            when {
                triggeredBy 'TimerTrigger'
            }
            steps {
                sh '''
                . venv/bin/activate
                pabot --processes 4 --include regression --outputdir reports tests/
                '''
            }
        }

        stage('Archive Reports') {
            steps {
                archiveArtifacts artifacts: 'reports/**/*', allowEmptyArchive: true
            }
        }
    }

    post {
        always {
            echo "Cleaning workspace..."
            cleanWs()
        }

        success {
            echo "Pipeline executed successfully ✅"
        }

        failure {
            echo "Pipeline failed ❌"
        }
    }
}