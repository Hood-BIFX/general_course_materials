#!/bin/bash

# This script automates the process of updating multiple student repositories
# with changes from a central template repository. It uses GitHub CLI and Git
# to clone each student repository, merge changes from the template, and push
# the updates back to the student's repository.

# --- Configuration ---
TEMPLATE_REPO="https://github.com/BIFX551-26/bifx551-26-classroom-16fb26-rchallenges-Rchallenges.git"
ORG_NAME="BIFX551-26" # The GitHub organization where student repos are located
ASSIGNMENT_PREFIX="rchallenges" # The prefix used for student repos

# --- Script Logic ---
# 1. Get a list of all repositories in the organization that match the assignment prefix
# this uses the GitHub CLI - install from https://cli.github.com/
repos=$(gh repo list $ORG_NAME --limit 1000 --json name --jq ".[].name | select(startswith(\"$ASSIGNMENT_PREFIX\"))")

for repo_name in $repos; do
    echo "------------------------------------------------"
    echo "Updating: $repo_name"
    
    # Clone the student repo into a temporary folder
    git clone "https://github.com/$ORG_NAME/$repo_name.git" "temp_$repo_name"
    cd "temp_$repo_name" || exit

    # Add the template as a remote
    git remote add template "$TEMPLATE_REPO"
    
    # Fetch and Merge
    git fetch template
    # We use --allow-unrelated-histories because templates/copies don't share history
    # -m is used to provide a default commit message for the merge
    if git merge template/main --allow-unrelated-histories -m "Syncing updates from template repository"; then
        # Push the changes back to the student's main branch
        git push origin main
        echo "Successfully updated $repo_name"
    else
        echo "CONFLICT in $repo_name. Manual resolution required."
    fi

    # Cleanup: move back out and remove the temp folder
    cd ..
    rm -rf "temp_$repo_name"
done

echo "Done!"