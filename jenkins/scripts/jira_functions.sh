#!/bin/bash

function get_jira_id_description() {
	JIRA_ID=$1
	get_jira_fields_from_jira_id ${JIRA_ID} summary
}

function get_jira_fields_from_jira_id() {
	JIRA_ID=$1
	FIELD_NAME=$2
	curl -u ${JIRA_USERNAME}:${JIRA_PASSWORD} -X GET -H "Content-Type: application/json" "${JIRA_URL}/issue/${JIRA_ID}" | jq ".fields.${FIELD_NAME}" -r
}
