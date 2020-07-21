#!/bin/bash

# Author : Huy Nguyen

githuburl=git@github.com:huynguyen-codeengine
#repos list, feel free to add more
declare -a repos=("liferay-blade-cli" "lfrapacgs" "liferay-portal-ee" "liferay-portal")
# check to ensure that you have all of the repos forked 
for i in "${repos[@]}"
 do
   repoURL="${githuburl}/${i}.git"
   echo "Checking $repoURL"
   $(/usr/bin/git ls-remote $repoURL -q)
   status=$?
   if [ $status -eq 0 ]
     then
	   echo "${repoURL} exist"
     else
	    echo "${repoURL} does not exist"
	    exit 1
   fi
 done
 
#Clone portal-ee
echo "Cloning from ${githuburl}/liferay-portal-ee.git"
mkdir liferay-portal-ee-worktree
mkdir liferay-portal-ee-worktree/master
git clone --no-tags "${githuburl}/liferay-portal-ee.git" liferay-portal-ee-worktree/master
#mv  /home/ces-user/E/liferay-portal-ee-worktree/master liferay-portal-ee-worktree/ 
cd liferay-portal-ee-worktree/master
git remote add upstream git@github.com:liferay/liferay-portal-ee.git
git remote add holatuwol git@github.com:holatuwol/liferay-portal.git
git worktree add ../7.2.x remotes/origin/7.2.x
git worktree add ../7.1.x remotes/origin/7.1.x
git worktree add ../7.0.x remotes/origin/7.0.x
git worktree add ../6.2.x remotes/origin/6.2.x
git clone --no-tags git@github.com:liferay/liferay-binaries-cache-2020.git
git clone --no-tags git@github.com:liferay/liferay-binaries-cache-2017.git
cd ..
cd ..
#Clone portal
echo "Cloning from ${githuburl}/liferay-portal.git"
mkdir liferay-portal-worktree
mkdir liferay-portal-worktree/master
git clone --no-tags "${githuburl}/liferay-portal.git" liferay-portal-worktree/master
cd liferay-portal-worktree/master
git add remote upstream git@github.com:liferay/liferay-portal.git
git remote add holatuwol git@github.com:holatuwol/liferay-portal.git
git worktree add ../7.2.x remotes/origin/7.2.x
git worktree add ../7.1.x remotes/origin/7.1.x
git worktree add ../7.0.x remotes/origin/7.0.x
git worktree add ../6.2.x remotes/origin/6.2.x
cd ..
cd ..
 






