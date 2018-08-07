pipeline {
	//https://jenkins.io/doc/book/pipeline/syntax/#agent
	agent {
		dockerfile true
	}
	environment {
		NAME_OF_ENV_VAR = 'test'
		SECOND_VAR = 'this'
	}
	stages {
		stage('Build') {
			steps {
				echo 'Building...'
			}
		}
		stage('Test') {
			steps {
				sh 'phpunit /vertex/tests/. --log-junit **/test-reports/*.xml'
			}
		}
		stage('Deploy') {
			steps {
				'Deploying...'
			}
		}
	}
	post {
		failure {
			junit '**/test-reports/*.xml'
		}
	}
}
