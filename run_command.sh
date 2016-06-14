#!/bin/bash

command=$1 && shift
exec $command "$@"
