job('Spring3HibernateAppReportGenerator') {
	description("I\'ll generate the report for application Spring3HibernateApp")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/Spring3HibernateApp')

  steps {
    shell("echo 'I will generate the report for commits lying between' \n cat previous.commit current.commit \n source ${JENKINS_HOME}/scripts/functions/git_functions.sh \n create_report_file_for_commits `cat previous.commit` `cat current.commit` \n cat list.commits ")
  }
 }
