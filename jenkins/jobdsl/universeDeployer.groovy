job('universeDeployer') {
        description("I\'ll deploy the applications on universe")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/universe')

  steps {
    shell("echo 'I will deploy code to app server'")
  }
 }
