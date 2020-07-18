#!/bin/bash -eu

echo 'init process'

mysql --user=isucon --password=isucon isucon -e "CREATE INDEX user_and_created_at ON memos (user,created_at);"