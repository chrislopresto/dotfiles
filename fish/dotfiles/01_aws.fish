function aws-set
  set --export AWS $argv[1]
  set --export AWS_DEFAULT_PROFILE $AWS
  set --export AWS_PROFILE $AWS

  set --export AWS_REGION (grep --after-context=2 "[profile $AWS]" ~/.aws/config | grep 'region' | sed -e 's#.*=\(\)#\1#' | xargs)
end
