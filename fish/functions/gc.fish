# Defined in - @ line 1
function gc --wraps='git add . && git commit -S' --description 'alias gc=git add . && git commit -S'
  git add . && git commit -S $argv;
end
