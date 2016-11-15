#!/bin/bash

get_jira_fields_from_jira_id(){
	JIRA_URL=$1
	JIRA_USERNAME=$2
	JIRA_PASSWORD=$3
	JIRA_ID=$4
	FIELD_NAME=$5
	curl -u ${JIRA_USERNAME}:${JIRA_PASSWORD} -X GET -H "Content-Type: application/json" "${JIRA_URL}/issue/${JIRA_ID}" | jq ".fields.${FIELD_NAME}" -r
}
