#!/bin/bash

function interactive_run() {
    if command -v winpty &> /dev/null; then
        winpty "$@"
    else
        "$@"
    fi
}

function help {
cat << "EOF"
Possible commands:
  build -- Builds the GreatSPN container
  start -- Starts the GreatSPN image
  stop -- Stops the GreatSPN image
  remove -- Removes the GreatSPN image
  enter -- Enters the GreatSPN image shell
  help -- Shows this help
EOF
}

for command in "$@"
do
  case $command in
    build)
      docker build --rm -t dice/greatspn -f Dockerfile .
      ;;
    start)
      docker run --name greatspn -d -p 2222:22 -e SSH_USERPASS=secret dice/greatspn
      ;;
    stop)
      docker stop greatspn
      ;;
    remove)
      docker rm greatspn
      ;;
    enter)
      interactive_run docker exec -it greatspn bash
      ;;
    help)
      help
      ;;
    *)
      echo "Invalid command: '$@'"
      help
      ;;
  esac
done