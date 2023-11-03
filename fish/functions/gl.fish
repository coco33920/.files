# Defined in - @ line 1
function gl --wraps='git pull origin master' --description 'alias gl=git pull origin master'
  git pull origin master $argv;
end
