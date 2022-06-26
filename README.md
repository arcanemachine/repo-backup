# repo-backup

Backup your GitHub and GitLab repos. Forked from [this repo](https://github.com/alexadam/repo-backup) (Their README has more thorough instructions on obtaining access tokens, but this one is easier to use IMO).


### Instructions

Your access tokens should be stored in `.env` so they can be used as environment variables in the scripts. Any data stored in `.env` will not be committed to the repo. A template can be copied from `.env.example`.

After copying your access token(s) to `.env`, just run the `backup-gitlab.sh` and/or `backup-github.sh` script to get a backup of all your repos.


### Access Tokens

For GitHub backup, you need a Personal Access Token with the following scopes:
  - repo
  - user - read:user

For GitHub backup, you need an Access Token with the following scopes:
  - read_user
  - read_api
