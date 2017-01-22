#!/bin/zsh

function aws-set {
  export AWS=$1
  export AWS_DEFAULT_PROFILE=$AWS
  export AWS_PROFILE=$AWS

  export AWS_REGION=$(grep --after-context=2 "\[profile ${AWS}\]" ~/.aws/config |
                      grep 'region'                                             |
                      sed -e 's#.*=\(\)#\1#'                                    |
                      xargs)

  if [[ "${2:-true}" = "true" ]]; then
    echo "AWS_PROFILE         : ${AWS_PROFILE}"
    echo "AWS_DEFAULT_PROFILE : ${AWS_DEFAULT_PROFILE}"
    echo "AWS_REGION          : ${AWS_REGION}"
    echo
  fi
}
