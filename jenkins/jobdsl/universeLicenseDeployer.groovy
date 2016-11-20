job('universeLicenseDeployer') {
        description("I\'ll deploy the application universe-license")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/universe_license')

  steps {
    shell("echo 'I will deploy code to app server' \n today_date=`date +\"%m-%d-%y\"` \n mkdir -p ${JENKINS_HOME}/deployments/universeLicense/${today_date} \n cp ${JENKINS_HOME}/data/universe_license/target/*.war ${JENKINS_HOME}/deployments/universeLicense/${today_date}/.")
  }
 }
