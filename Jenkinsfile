pipeline {
	//https://jenkins.io/doc/book/pipeline/syntax/#agent
	agent {
		dockerfile true
	}
	stages {
		stage('Test') {
		steps {
			sh 'node --version'	//RUN TESTS
			}
		}
	}
}