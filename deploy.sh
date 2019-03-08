#!/bin/bash
echo ""
echo ""
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
echo ""
echo ""

echo "Uploading changes of root folder"
git add .
git commit -m "Updating site `date`"
git push origin master

echo ""
echo ""
echo "Uploading public folder"
# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd ..

cd lucasbianchi.github.io
cp -av mi_sitio/public/* .
 
# Add changes to git.
git add .

# Commit changes.
msg="Rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
cd mi_sitio