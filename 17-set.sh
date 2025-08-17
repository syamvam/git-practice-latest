#!/bin/bash
set -e # setting the automatic exit, if we get error,set -ex for deug

failure(){
      echo "Failed at $1:$2"
}
trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR #ERR IS THE ERROR SIGNAL

echo "hellow world succces"
echoooo "Hello world failure"
echo "hello world success"


