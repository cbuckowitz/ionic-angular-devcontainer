ionic start ${PWD##*/} blank --type=angular --no-git
cd ${PWD##*/}
mv * ..
mv .* ..
cd ..
rmdir ${PWD##*/}
