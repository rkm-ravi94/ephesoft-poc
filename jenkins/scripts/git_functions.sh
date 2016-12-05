#!/bin/bash

create_report_file_for_commits() {
#	LAST_COMMIT_ID=$1
#	RECENT_COMMIT_ID=$2

#	echo "Last commit Id: $LAST_COMMIT_ID"
#	echo "Recent commit Id: $RECENT_COMMIT_ID"
#	git rev-list ${LAST_COMMIT_ID}...${RECENT_COMMIT_ID} > list.commits
	>all_info_commits.txt
	for commit_id in `cat commits.txt`
	do
		git log --format=%s%b -n 1 ${commit_id} | head -1 > tmp_commit_msg
   		commit_regex='(^EUN-[0-9]+:)'
   		if ! grep -iqE "$commit_regex" "tmp_commit_msg"; then
			echo "Wrong commit msg: ${commit_id}"
		else
			git log --pretty="%H#%s#%an" -n 1 ${commit_id} >> all_info_commits.txt
   		fi
		#git log --format=%s%b -n 1 ${commit_id} | head -1 >> messages.commits
	done

}

create_report_file_for_wrong_commits(){
>wrong_commits.txt
#while read -r commit
while read commit || [ -n "$commit" ];
do
   echo $commit
   git log --format=%s%b -n 1 ${commit} | head -1 > tmp_commit_msg
   commit_regex='(^EUN-[0-9]+:)'
   if ! grep -iqE "$commit_regex" "tmp_commit_msg"; then
        git log --pretty="%H#%s#%an#%ae" -n 1 ${commit} >>  wrong_commits.txt
   fi 
done < commits.txt
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
		git log --format=%s%b -n 1 ${commit_id} | head -1 >> ${WORKSPACE}/tmp_new_commit_messages
	done
	echo "Printing all commit messages since last commit:"
	cat ${WORKSPACE}/tmp_new_commit_messages
}
