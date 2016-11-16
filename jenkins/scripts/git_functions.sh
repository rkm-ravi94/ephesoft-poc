#!/bin/bash

create_report_file_for_commits() {
	LAST_COMMIT_ID=$1
	RECENT_COMMIT_ID=$2

	git rev-list ${LAST_COMMIT_ID}...${RECENT_COMMIT_ID} > list.commits
	for commit_id in `cat list.commits`
	do
		git log --format=%B -n 1 ${commit_id} | head -1 >> messages.commits
	done
	
}
get_all_commits_from_last_commit(){
	GIT_REPO="$1"
	GIT_BRANCH="$2"
	CONFIGS_HOME="$3"
	WORKSPACE="$4"
	GIT_DIR_NAME=`echo ${GIT_REPO} | xargs basename | xargs basename -s '.git'`
	OLD_COMMIT_ID=`cat ${CONFIGS_HOME}/lastCommit_${GIT_DIR_NAME}_${GIT_BRANCH}`
	pwd
	cd ${WORKSPACE}/${GIT_DIR_NAME}
	git checkout ${GIT_BRANCH}
	git rev-list ${OLD_COMMIT_ID}..HEAD > ${WORKSPACE}/tmp_new_commits
	if ! [ -s ${WORKSPACE}/tmp_new_commits ]
	then
		return 1
	fi
	for commit_id in `cat ${WORKSPACE}/tmp_new_commits`
	do
		git log --format=%B -n 1 ${commit_id} | head -1 >> ${WORKSPACE}/tmp_new_commit_messages
	done
	echo "Printing all commit messages since last commit:"
	cat ${WORKSPACE}/tmp_new_commit_messages
}
