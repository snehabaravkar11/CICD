pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				echo "Building the Project.........."
			}
		}
		stage('Test') {
			steps {
				sh '''
					python3 -m pip install --upgrade pip
					python3 -m pip install -r requirements.txt
					python3 -m robot --include smoke tests/
					python3 run_tests.py
				'''
			}
		}
		stage('Deploy') {
			steps {
				echo "Deploying the Project.........."
				always {

            robot outputPath: 'reports'

            archiveArtifacts artifacts: 'reports/*'

        }

        success {
            echo 'Tests Passed!'
        }

        failure {
            echo 'Tests Failed!'
        }
			}
		}
	}
}

