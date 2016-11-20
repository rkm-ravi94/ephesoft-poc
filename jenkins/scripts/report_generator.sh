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
  addHeader "JIRA-Reporter"
  endRow
  while read -r jiraid
	do
    startRow
    JIRA_TITLE=`get_jira_id_description ${jiraid}`
    JIRA_STATUS=`get_jira_status_from_jira_id ${jiraid}`
    JIRA_REPORTER=`get_jira_reporter_from_jira_id ${jiraid}`
    addCell "${jiraid}"
    addCell "${JIRA_TITLE}"
    addCell "${JIRA_STATUS}"
    addCell "${JIRA_REPORTER}"
    endRow
	done < jiraid.commits
  endTable
  endBody
  endHtml
}
