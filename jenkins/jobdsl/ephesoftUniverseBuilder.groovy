mavenJob('ephesoftUniverseBuilder') {
        description("I\'ll build the applications on ephesoft-universe")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/ephesoft_universe')
        scm {
                git {
                branch('*/sprint-14')
                remote {
                        name('')
                        refspec('')
                        url('git@github.com:Ephesoft/ephesoft-universe.git')
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
