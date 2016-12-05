function generateReport() {
  PROJECT=$1

  setHTMLFile jiraReport.html
  startHTML
  addTitle "Daily Commits Report for Project ${PROJECT}"
  addBody
  startHTML
  startTable
  startRow
  addHeader "JIRA-ID"
  addHeader "JIRA-Summary"
  addHeader "JIRA-STATUS"
  addHeader "JIRA-Assignee"
  addHeader "JIRA-Reporter"
  addHeader "Committers"
  endRow
  while read -r line
	do
    startRow
    jiraid=`echo ${line} | awk -F'#' '{print $1}'`
    committers=`echo ${line} | awk -F'#' '{print $2}'`
    JIRA_TITLE=`get_jira_id_description ${jiraid}`
    JIRA_STATUS=`get_jira_status_from_jira_id ${jiraid}`
    JIRA_ASSIGNEE=`get_jira_assignee_from_jira_id ${jiraid}`
    JIRA_LINK="<a href=\"https://ephesoft.atlassian.net/browse/${jiraid}\">${jiraid}</a>"
    JIRA_REPORTER=`get_jira_reporter_from_jira_id ${jiraid}`
    addCell "${JIRA_LINK}"
    addCell "${JIRA_TITLE}"
    addCell "${JIRA_STATUS}"
    addCell "${JIRA_ASSIGNEE}"
    addCell "${JIRA_REPORTER}"
    addCell "${committers}"
    endRow
	done < jira_id_and_committers_unique
  endTable
  endBody
  endHtml
}

function generateReportWrongCommits(){
  PROJECT=$1

  setHTMLFile wrong_commits_report.html
  startHTML
  addTitle "Daily Wrong Commits Report for Project ${PROJECT}"
  addBody
  startHTML
  startTable
  startRow
  addHeader "Commit ID"
  addHeader "Commit Msg"
  addHeader "Author Name"
  addHeader "Author Email"
  endRow
  while read -r line
        do
    startRow
    commit=`echo $line | cut -d'#' -f1`
    commit_msg=`echo $line | cut -d'#' -f2`
    author_name=`echo $line | cut -d'#' -f3`
    author_email=`echo $line | cut -d'#' -f4`
    addCell "${commit}"
    addCell "${commit_msg}"
    addCell "${author_name}"
    addCell "${author_email}"
    endRow
  done < wrong_commits.txt
  endTable
  endBody
  endHtml 
}
