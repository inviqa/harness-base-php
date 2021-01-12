#!/bin/bash

lighthouse --no-enable-error-reporting \
           --chrome-flags="--headless --no-sandbox=true" \
           --output-path=/home/headless/lighthouse-results.html \
           ${TARGET_URL}
