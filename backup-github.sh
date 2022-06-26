#!/bin/sh

cd $(dirname "$0")

# source dotenv
set -o allexport; source .env; set +o allexport

dirname=./backup-dir/github-backup-$(date "+%Y-%m-%d-%H-%M")
mkdir -p "$dirname"
cd $dirname

# vars should be modified in the .env file to avoid commiting them to the repo.
# if you don't care, just modify them here
username=$GITHUB_USERNAME
access_token=$GITHUB_ACCESS_TOKEN

echo "Backing up your GitHub repos...
"

curl -H "Accept: application/vnd.github.nebula-preview+json" \
    -H "Authorization: token $access_token" \
    "https://api.github.com/user/repos?visibility=all&affiliation=owner&per_page=200" \
    | tac | tac | jq -r '.[] | .name' \
    | while IFS= read project_name; do
        curl -H "Authorization: token $access_token" -H "Accept: application/vnd.github.v3.raw" -L \
         "https://api.github.com/repos/$username/$project_name/zipball" --output $project_name.zip
     done

echo Done! All files downloaded here: $(pwd)
