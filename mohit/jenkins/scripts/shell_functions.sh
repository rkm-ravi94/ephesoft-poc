#!/bin/bash

extract_commit_ids_from_commit_messages_file(){
	WORKSPACE=$1
	cut -d':' -f1 ${WORKSPACE}/tmp_new_commit_messages > ${WORKSPACE}/tmp_jira_ids
}
