#!/bin/bash

### Creating some function
function echobold { #'echobold' is the function name
    echo -e "\033[1m${1}\033[0m" # this is whatever the function needs to execute.
}
function echobold { #'echobold' is the function name
    echo -e "${BOLD}${1}${NONE}" # this is whatever the function needs to execute, note ${1} is the text for echo
}
function echoitalic { #'echobold' is the function name
    echo -e "\033[3m${1}\033[0m" # this is whatever the function needs to execute.
}

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echobold "                              UPDATING WEBSITE"
echo "                                    version 1.0"
echo ""
echoitalic "* Written by  : <YOUR-NAME>"
echoitalic "* E-mail      : your@email.com"
echoitalic "* Last update : <fill-in-a-date>"
echoitalic "* Version     : v1.0"
echo ""
echoitalic "* Description : This script will set some directories, execute some things, "
echoitalic "                and will then update the website."
echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Today's: "$(date)
TODAY=$(date +"%Y%m%d")
echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echobold "The following directories are set."

USERROOT="/Users/naimcinar"
ROOT="/Users/<naincinar>/hugo_site"
WEBSITE="${ROOT}/hugo_site"
WEBSITEPUBLIC="${WEBSITE}/public"

echo "Root directory____________ ${ROOT}"
echo "Website root directory____ ${WEBSITE}"
echo "Public website____________ ${WEBSITEPUBLIC}"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echobold "Deploying updates to GitHub."

echo "* Building the project..."
cd ${WEBSITE}
rm -rvf ${WEBSITEPUBLIC}
rm -rvf ${WEBSITEPUBLIC}

git status
git add -A
git commit -m "Committing the (updated) source files."
git push origin master

hugo # if using a theme, replace by `hugo -t <yourtheme>`

### Depending on your needs, you can create a LICENSE file and README.md. You can use
### these as an example 
cp -v ${ROOT}/LICENSE ${WEBSITEPUBLIC}/LICENSE
cp -v ${ROOT}/README.md ${WEBSITEPUBLIC}/README.md
### If you want to re-direct your GitHub page to another domain, you'll have to make a
### 'CNAME' file.
echo "http://www.<some-domain>.com" > ${WEBSITEPUBLIC}/CNAME

echo "* Going to 'public' folder..."

cd ${ROOT}/<nakiamo>.github.io

cp -afv ${ROOT}/hugo_site/public/* .

echo "* Add changes to git..."

git status
git add -A

echo "* Commit changes..."
msg="> Rebuilding site $(date)."
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg."

# Push source and build repos.
git push origin master

# Come Back
cd ${ROOT}