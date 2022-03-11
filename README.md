# repo-backup

Backup your GitHub and GitLab repos. Forked from [this repo](https://github.com/alexadam/repo-backup) (His README has more thorough instructions on obtaining access tokens, but this one is easier to use IMO).


### Instructions

Environment variables should be stored in `.envrc`. A template can be copied from `.envrc.example`.

After copying your access token(s) to `.envrc`, just run the `backup-gitlab.sh` and/or `backup-github.sh` script to get a backup of all your repos.


### Access Tokens

For GitHub backup, you need a Personal Access Token with the following scopes:
  - repo
  - user - read:user

For GitHub backup, you need an Access Token with the following scopes:
  - read_user
  - read_api
