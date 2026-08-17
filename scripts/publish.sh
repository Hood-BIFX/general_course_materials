#!/usr/bin/bash

# render the website
quarto render
quarto render --profile slides

# Copy rendered website to pages branch
# Assumes the pages branch is cloned to a separate direcotry
# Sepcifially, this assumes you have the `origin-pages` branch cloned at `../origin-pages`
# For example, when running this script from within the `BIFX545-26/CourseInfo` directory, 
# this will build the course website and push the updates to `BIFX545/origin-pages`
# should be run inside of the repository root at `BIFX545/CourseInfo`

scp -r docs_updt/* ../origin-pages/
