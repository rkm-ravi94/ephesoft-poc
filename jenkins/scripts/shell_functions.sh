#!/bin/bash

extract_commit_ids_from_commit_messages_file(){
	cut -d':' -f1 messages.commits > jiraid.commits
}

function get_job_status(){
	JOB_NAME=$1
	curl -u esAdmin:admin\@\#\$123 http://205.147.109.182:8080/job/${JOB_NAME}/lastBuild/api/json | grep -q "\"result\":\"SUCCESS\""
	if [ $? -eq 0 ]
	then
    		echo "true"
    		echo "true" > build_job_status
	else
    		echo "false"
    		echo "false" > build_job_status
	fi
}
