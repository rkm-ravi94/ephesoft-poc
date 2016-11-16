mavenJob('Spring3HibernateAppDeployer') {
	description("I\'ll deploy the application Spring3HibernateApp")
    logRotator(-1, 10)
	scm {
   		git {
     		branch('*/master')
     		remote {
       			name('')
       			refspec('')
       			url('https://github.com/OpsTree/ContinuousIntegration.git')
     		}
   		}
 	}
 	//please enable the maven in your jenkins form jenkins configuration
 	goals('clean package')
 	rootPOM('Spring3HibernateApp/pom.xml')
}
