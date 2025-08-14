#!/bin/bash

branch=$1
 
git checkout $branch

terraform workspace select $branch || terraform workspace new $branch