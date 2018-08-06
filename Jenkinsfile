pipeline {
	//https://jenkins.io/doc/book/pipeline/syntax/#agent
	agent {
		dockerfile true
	}
	stages {
		stage('Test') {
		steps {
			sh 'phpunit /vertex/tests/.'
			}
		}
	}
	post {
		failure {
			junit 'build/reports/**/*.xml'
		}
	}
}
