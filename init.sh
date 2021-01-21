#!/bin/bash

PROJECT_NAME=$(basename $PWD)

if [ $# -ne 1 ]; then
  echo "usage: $0 'PROJECT_DESCRIPTION'"
  exit -1
fi

sed -i "s/BusBlasterV3Template/$PROJECT_NAME/g" BusBlasterV3Template.v
sed -i "s/BusBlasterV3Template/$PROJECT_NAME/g" BusBlasterV3Template.xise

sed -i "s/BusBlasterV3_Template_Desc/$1/g" BusBlasterV3Template.v
sed -i "s/BusBlasterV3_Template_Desc/$1/g" BusBlasterV3Template.xise

mv BusBlasterV3Template.v $PROJECT_NAME.v
mv BusBlasterV3Template.ucf $PROJECT_NAME.ucf
mv BusBlasterV3Template.xise $PROJECT_NAME.xise

echo "$1" > README.md

rm init.sh

git add * BusBlasterV3Template.ucf BusBlasterV3Template.v BusBlasterV3Template.xise init.sh
git commit --am -am "Initial Commit"
git push -f

