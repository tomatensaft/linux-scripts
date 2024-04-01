## short git console tutorial

### repo handling

first create testrepo at the docker gitea server

clone repo from server

```
git clone http://localhost:3000/tec/test-first
```

or create folder and init repo
```
mkdir test-second
git init
```

create file and check status
```
touch test.xml
git status
```

### stage files to local repo

stage file and check status (for stage all files use `git add --a` or `git add -A` )
```
git add test.xml
git status
```

unstage file if when there is a problem
```
git reset HEAD test.xml
```

### commit to local repo

commit stages
```
git commit -m "commit changes"
```

commit correct message
```
git commit --amend -m "commit changes corrected"
```

stage and commit all tracked files
```
git commit -a -m "commit changes"
```

check committs (if needed)
```
it log --oneline --decorate --graph --all --branches
```

set remote repo
```
git remote add origin http://localhost:3000/tec/test-second
```

set local user for local server
```
git config user.name "myusername"
git config user.email "local@mail.com"
```

### push/pull from/to remote server

push to local server
```
git push origin master
```

pull from server to local
```
git pull origin master
```

### git branch

create new branch
```
git branch new_branch
```

switch to new branch
```
git checkout new_branch
```

merge branch
```
git merge new_branch
```

delete branch
```
git branch -d new_branch
```

### git logs

show log of repo
```
git log
git log --oneline
git log --stat  
```

show / diff content of commit
```
git show (commit-id of git log)
```

### git local hard reset

local repo hard reset
```
git reset --hard HEAD
git clean -f -d
git pull
```
