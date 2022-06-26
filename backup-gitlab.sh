#!/bin/sh

cd $(dirname "$0")

# source dotenv
set -o allexport; source .env; set +o allexport

dirname=./backup-dir/gitlab-backup-$(date "+%Y-%m-%d-%H-%M")
mkdir -p "$dirname"
cd $dirname

# vars should be modified in the .env file to avoid commiting them to the repo:
# if you don't care, just modify them here
username=$GITLAB_USERNAME
access_token=$GITLAB_ACCESS_TOKEN

echo "Backing up your GitLab repos...
"

curl --header "Private-Token: $access_token" "https://gitlab.com/api/v4/users/$username/projects" \
   | jq -r '.[] | .id, .name' \
   | while IFS= read project_id; read project_name; do
        curl --header "Private-Token: $access_token" "https://gitlab.com/api/v4/projects/$project_id/repository/archive.zip" --output $project_name.zip
    done

echo Done! All files downloaded here: $(pwd)
