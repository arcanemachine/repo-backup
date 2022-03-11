#!/bin/sh

source $(dirname "$0")/.envrc

dirname=gitlab-backup-$(date "+%Y-%m-%d-%H-%M")
mkdir "$dirname"
cd $dirname

username=$GITLAB_USERNAME
access_token=$GITLAB_ACCESS_TOKEN

curl --header "Private-Token: $access_token" "https://gitlab.com/api/v4/users/$username/projects" \
   | jq -r '.[] | .id, .name' \
   | while IFS= read project_id; read project_name; do
        curl --header "Private-Token: $access_token" "https://gitlab.com/api/v4/projects/$project_id/repository/archive.zip" --output $project_name.zip
    done

echo Done! All files downloaded here: $(pwd)
