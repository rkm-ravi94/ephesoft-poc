function generateReport() {
  PROJECT=$1

  setHTMLFile jiraReport.html
  startHTML
  addTitle "Daily Commits Report for Project ${PROJECT}"
  addBody
  startHTML
  startTable
  while read -r jiraid
	do
    startRow
    JIRA_TITLE=`get_jira_id_description ${jiraid}`
    addCell "${jiraid}"
    addCell "${JIRA_TITLE}"
    endRow
	done < jiraid.commits
  endTable
  endBody
  endHtml
}
