function generateReport() {
  PROJECT=$1

  setHTMLFile jiraReport.html
  startHTML
  addTitle "Daily Commits Report for Project ${PROJECT}"
  addBody
  startHTML
  startTable
  while read -r line
	do
    startRow
    addCell "${line}"
    endRow
	done < messages.commits
  endTable
  endBody
  endHtml
}
