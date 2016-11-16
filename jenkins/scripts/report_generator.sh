function generateReport() {
  PROJECT=$1

  setHTMLFile jiraReport.html
  startHTML
  addTitle "Daily Commits Report for Project ${PROJECT}"
  addBody
  startHTML
  startTable
  for jira_id in `cat jiraid.commits`
	do
    startRow
    addCell ${jira_id}
    endRow
	done
  endTable
  endBody
  endHtml
}
