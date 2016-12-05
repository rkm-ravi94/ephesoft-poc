#!/bin/bash
INFO_FILE_SOURCE_DIR=$1
awk -F# '{split($2,a,/:/);$2=a[1]}1' OFS=# ${INFO_FILE_SOURCE_DIR}/all_info_commits.txt | awk -F'#' 'NF>1{a[$2] = a[$2]","$3};END{for(i in a){print i""a[i]}}' | sed -e "s/,/$(printf '#')/" > ${INFO_FILE_SOURCE_DIR}/jira_id_and_committers_duplicate
awk -F'#' '{print $1}' ${INFO_FILE_SOURCE_DIR}/jira_id_and_committers_duplicate > ${INFO_FILE_SOURCE_DIR}/jira_ids
awk -F'#' '{print $2}' ${INFO_FILE_SOURCE_DIR}/jira_id_and_committers_duplicate > ${INFO_FILE_SOURCE_DIR}/duplicate_committers
>${INFO_FILE_SOURCE_DIR}/unique_committers
while read -r line
do
	echo $line | tr -s ','  '\n' | sort | uniq | paste -d, -s >> ${INFO_FILE_SOURCE_DIR}/unique_committers
done < ${INFO_FILE_SOURCE_DIR}/duplicate_committers
paste -d"#" ${INFO_FILE_SOURCE_DIR}/jira_ids ${INFO_FILE_SOURCE_DIR}/unique_committers > ${INFO_FILE_SOURCE_DIR}/jira_id_and_committers_unique
cat ${INFO_FILE_SOURCE_DIR}/jira_id_and_committers_unique
