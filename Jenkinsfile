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
					python3 -m robot --outputdir reports --include smoke tests/
				'''
			}
		}
		stage('Deploy') {
			steps {
				echo "Deploying the Project.........."
			}
		}
		stage('Publish Report') {
			steps {
				publishHTML([
					reportDir: 'reports',
					reportFiles: 'report.html',
					reportName: 'Robot Framework Report',
					keepAll: true,
					alwaysLinkToLastBuild: true,
					allowMissing: false
				])
				archiveArtifacts artifacts: 'reports/*.html, reports/*.xml', fingerprint: true
			}
		}
	}
}

