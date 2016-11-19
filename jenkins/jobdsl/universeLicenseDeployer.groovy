job('universeLicenseDeployer') {
        description("I\'ll deploy the application universe-license")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/universe_license')

  steps {
    shell("echo 'I will deploy code to app server'")
  }
 }
