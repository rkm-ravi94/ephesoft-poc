job('Spring3HibernateAppDeployer') {
	description("I\'ll deploy the application Spring3HibernateApp")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/Spring3HibernateApp')

  steps {
    shell("echo 'I will deploy code to app server'")
  }
 }
