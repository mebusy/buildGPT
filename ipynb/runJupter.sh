#!/bin/sh

set -e

docker run --rm -it -p 8888:8888 \
        -v "$(pwd)":/workspace --pids-limit 16384 \
        mebusy/pytorch bash -c "cd /workspace && jupyter lab --allow-root --ip 0.0.0.0 --no-browser"
