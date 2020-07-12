# user-configuration
.bashrc, .vimrc, etc for sharing between multiple os instances

1. Run this setup file
2. For convinience, enable git credential helper
  ```bash
  git config credential.helper store
  git push <repo> <branch>
  
  git config --global credential.helper cache
  git config --global credential.helper 'cache --timeout=7200'
  
  #Store data in unencrypted form locally for 2 hours
  ```
