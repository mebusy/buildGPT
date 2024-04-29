#!/bin/sh

set -e

docker run --rm -it -v "$(pwd)":/workspace  mebusy/pytorch bash -c "cd /workspace && python bigram.py"
