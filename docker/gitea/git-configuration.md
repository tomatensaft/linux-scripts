## git configuration

### remote repo configuration

check remote repo configuration
```
git remote -v
```

set repo when not cloned from server
```
git remote add origin https://yourgithubserver.com/yourrepo.git
```

### set username and mail with console

for global repos
```
git config --global user.name "myusername"
git config --global user.email "global@mail.com"
```

for local repos
```
git config user.name "myusername"
git config user.email "local@mail.com"
```


### set username and mail with configuration files

the global configuration can be found in `.gitconfig` 
```
[user]
 name = global_user
 email = global_email
```

when more different accounts are used create a global `.gitconfig` 
```
[includeIf "gitdir:~/private/"]
  path = ~/.gitconfig-private
[includeIf "gitdir:~/public/"]
  path = ~/.gitconfig-public
```

and different other files for each directory `.gitconfig-private` 
```
[user]
 name = private_user
 email = private_email
```