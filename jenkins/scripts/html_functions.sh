function setHTMLFile() {
  HTML_FILE=$1
  >${HTML_FILE}
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

function addBody() {
  addContent "<body>"
}

function startTable() {
  addContent "<table border='1' width='100%' sortable bgcolor='lightgreen'>"
}

function startRow() {
  addContent "<tr>"
}

function addCell() {
  CONTENT=$1
  addContent "<td>$1</td>"
}

function endRow() {
  addContent "</tr>"
}

function endTable() {
  addContent "</table>"
}

function endBody() {
  addContent "</body>"
}

function endHtml() {
  addContent "</html>"
}
