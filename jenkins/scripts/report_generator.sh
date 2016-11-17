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
    addCell "${jiraid}"
    endRow
	done < jiraid.commits
  endTable
  endBody
  endHtml
}
