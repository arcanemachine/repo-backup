#!/bin/bash

cd $(dirname "$0")

bash backup-github.sh
bash backup-gitlab.sh
