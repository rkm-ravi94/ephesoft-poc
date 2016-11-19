mavenJob('universeLicenseBuilder') {
        description("I\'ll build the application universe-license")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/universe_license')
        scm {
                git {
                branch('*/master')
                remote {
                        name('')
                        refspec('')
                        url('git@github.com:Ephesoft/universe-license.git')
                }
                }
        }
  preBuildSteps {
    shell("echo \$GIT_PREVIOUS_COMMIT > previous.commit \n echo \$GIT_COMMIT > current.commit")
  }
        //please enable the maven in your jenkins form jenkins configuration
        goals('clean package')
        rootPOM('pom.xml')
}
