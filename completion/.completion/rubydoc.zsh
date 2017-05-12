_rubydoc() {
  gems=(${(f)"$(gem list | egrep '^\S+' -o)"})

  _describe -t gems "rubydoc" gems
}

compdef _rubydoc rubydoc
