job('Spring3HibernateAppReportGenerator') {
	description("I\'ll generate the report for application Spring3HibernateApp")
  logRotator(-1, 10)
  customWorkspace('$JENKINS_HOME/data/Spring3HibernateApp')

  steps {
    shell("#!/bin/bash \n echo 'I will generate the report for commits lying between' \n cat previous.commit current.commit \n source ${JENKINS_HOME}/scripts/functions/git_functions.sh \n source /var/jenkins_home/scripts/functions/shell_functions.sh \n source /var/jenkins_home/scripts/functions/html_functions.sh \n source /var/jenkins_home/scripts/functions/report_generator.sh \n source /var/jenkins_home/jira.properties \n create_report_file_for_commits `cat previous.commit` `cat current.commit` \n cat list.commits \n cat messages.commits \n extract_commit_ids_from_commit_messages_file \n cat jiraid.commits \n generateReport")
  }

	publishers {
		extendedEmail {
      recipientList('sandeep@opstree.com')
			defaultSubject('Daily Report for Spring3HibernateProject')
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
