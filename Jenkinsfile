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
					python3 -m robot --include tags:smoke tests/
				'''
			}
		}
		stage('Deploy') {
			steps {
				echo "Deploying the Project.........."
			}
		}
	}
}

