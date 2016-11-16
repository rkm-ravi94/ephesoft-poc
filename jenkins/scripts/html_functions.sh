function setHTMLFile() {
  HTML_FILE=$1
}

function addContent() {
  echo $1 >> ${HTML_FILE}
}

function startHTML() {
  addContent "<html>"
}

function addTitle() {
  TITLE=$1
  addContent "<title>$1</title>"
}
