job('ephesoftUniverseDeployer') {
        description("I\'ll deploy the applications on ephesoft-universe")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/ephesot_universe')

  steps {
    shell("echo 'I will deploy code to app server'")
  }
 }
