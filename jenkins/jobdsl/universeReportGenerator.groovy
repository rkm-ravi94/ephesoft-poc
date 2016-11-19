job('universeReportGenerator') {
	description("I\'ll generate the report for applications on universe")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/universe')

  steps {
    shell("#!/bin/bash \n echo 'I will generate the report for commits lying between' \n cat previous.commit current.commit \n source ${JENKINS_HOME}/scripts/functions/git_functions.sh \n source ${JENKINS_HOME}/scripts/functions/shell_functions.sh \n source ${JENKINS_HOME}/scripts/functions/html_functions.sh \n source ${JENKINS_HOME}/scripts/functions/report_generator.sh \n source ${JENKINS_HOME}/scripts/functions/jira_functions.sh \n source ${JENKINS_HOME}/properties/jira.properties \n if [ \"`cat previous.commit`\" == \"`cat current.commit`\" ] \n then \n 	echo \"no change\" \n    exit 0 \n fi \n create_report_file_for_commits `cat previous.commit` `cat current.commit` \n cat list.commits \n cat messages.commits \n extract_commit_ids_from_commit_messages_file \n cat jiraid.commits \n generateReport")
  }

	publishers {
		extendedEmail {
      recipientList('devops@ephesoft.com')
			defaultSubject('Daily Report for universe-icense')
      defaultContent('${SCRIPT, template=\"jiraReport.html\"}')
			contentType('text/html')
			triggers {
				always()
				stillUnstable {
					subject('Subject')
					content('Body')
					sendTo {
						developers()
						requester()
						culprits()
					}
 				}
			}
		}
	}
 }
