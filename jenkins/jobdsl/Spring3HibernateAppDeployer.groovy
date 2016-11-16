mavenJob('Spring3HibernateAppDeployer') {
	description("I\'ll deploy the application Spring3HibernateApp")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/Spring3HibernateApp')
	scm {
   		git {
     		branch('*/dev-OrclCiCdPOC')
     		remote {
       			name('')
       			refspec('')
       			url('https://github.com/OpsTree/ContinuousIntegration.git')
     		}
   		}
 	}
  preBuildSteps {
    shell("echo $GIT_PREVIOUS_COMMIT > previous.commit \n echo $GIT_COMMIT > current.commit")
  }
 	//please enable the maven in your jenkins form jenkins configuration
 	goals('clean package')
 	rootPOM('Spring3HibernateApp/pom.xml')
}
