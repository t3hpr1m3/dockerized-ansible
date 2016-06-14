#!/bin/bash

command=$1

shift

echo "command: $command"

exec $command "$@"
