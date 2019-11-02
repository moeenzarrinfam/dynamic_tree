#!/bin/bash
set -e

exec rails server -p $PORT

exec "$@"