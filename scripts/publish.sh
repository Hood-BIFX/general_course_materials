#!/usr/bin/bash

# render the website
quarto render
quarto render --profile slides

# Copy rendered website to pages branch
# Assumes the pages branch is set up as a worktree in GitKraken
# Alternately, this assumes you have the `origin-pages` branch cloned at `../${DIR}.worktrees/origin-pages`
# For example, when running this script from within the `BIFX545-26/CourseInfo` directory, 
# this will build the course website and push the updates to `BIFX545/CourseInfo.worktrees/origin-pages`
# should be run inside of the repository root

export DIR=$(basename "$(pwd)")

scp -r docs_updt/* ../${DIR}.worktrees/origin-pages
