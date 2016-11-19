mavenJob('universeBuilder') {
        description("I\'ll build the applications on universe")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/universe')
        scm {
                git {
                branch('*/master')
                remote {
                        name('')
                        refspec('')
                        url('git@github.com:Ephesoft/Universe.git')
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
