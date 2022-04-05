#!/bin/bash

echo "Input your first name (all lowercase)"
read firstname

echo "Input your last name (all lowercase)"
read lastname

git checkout -b "feat/gha-workshop-$firstname-$lastname"
git push --set-upstream origin "feat/gha-workshop-$firstname-$lastname"
