#!/bin/bash

username=test
groupname=secretReadWrite

echo "creating $username"

aws iam create-user --user-name $username

aws iam add-user-to-group --user-name $username --group-name $groupname
