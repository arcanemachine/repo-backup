#!/bin/sh

source $(dirname "$0")/.envrc

dirname=github-backup-$(date "+%Y-%m-%d-%H-%M")
mkdir "$dirname"
cd $dirname

#change these vars:
username=$GITHUB_USERNAME
access_token=$GITHUB_ACCESS_TOKEN

curl -H "Accept: application/vnd.github.nebula-preview+json" \
    -H "Authorization: token $access_token" \
    "https://api.github.com/user/repos?visibility=all&affiliation=owner&per_page=200" \
    | tac | tac | jq -r '.[] | .name' \
    | while IFS= read project_name; do
        curl -H "Authorization: token $access_token" -H "Accept: application/vnd.github.v3.raw" -L \
         "https://api.github.com/repos/$username/$project_name/zipball" --output $project_name.zip
     done

echo Done! All files downloaded here: $(pwd)
