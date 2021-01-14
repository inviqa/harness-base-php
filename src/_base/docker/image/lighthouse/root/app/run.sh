#!/bin/bash
set -e -o pipefail

reportDir="/home/headless/results"

mkdir -p "${reportDir}"

lighthouse --no-enable-error-reporting \
           --chrome-flags="--headless --no-sandbox=true" \
           --output-path="${reportDir}/lighthouse-results.html" \
           "${TARGET_URL}"
