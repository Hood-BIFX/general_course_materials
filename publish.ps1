
# this script is for running in the PowerShell - use `publish.sh` for running on linux/wsl

# to run this script from the PowerShell you'll first need to enable RemoteSigned execution policy with
# `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

# the script assumes you have the `origin-pages` branch cloned at `..\${DIR}.worktrees\origin-pages`
# For example, when running this script from within the `BIFX545-26\CourseInfo` directory, 
# this will build the course website and push the updates to `BIFX545\CourseInfo.worktrees\origin-pages`

# render the website
quarto render
quarto render --profile slides

# copy rendered website to pages branch
# assumes the pages branch is set up as a worktree in GitKraken
# should be run inside of the repository root

$DIR = (Get-Location | Split-Path -Leaf)

Copy-Item -Path "docs_updt\*" -Destination "..\\${DIR}.worktrees\origin-pages" -Recurse -Force
