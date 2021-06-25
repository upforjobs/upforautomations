#!/usr/bin/env bash
set -e
# source ../.env

# Run an individual test suite if the TEST_SUITE environmental variable is set.
if [ -z "$TEST_SUITE" ]; then
    TEST_SUITE=""
fi

CMD="robot --console verbose --outputdir /app/reports /app/suites/$TEST_SUITE"

echo ${CMD}

``${CMD}``