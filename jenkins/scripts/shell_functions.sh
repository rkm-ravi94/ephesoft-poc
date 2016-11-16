#!/bin/bash

extract_commit_ids_from_commit_messages_file(){
	cut -d':' -f1 messages.commits > jiraid.commits
}
