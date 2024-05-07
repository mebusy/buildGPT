#!/bin/sh

set -e


# if os is darwin
if [ "$(uname)" == "Darwin" ]; then
    docker run --rm -it -v "$(pwd)":/workspace  mebusy/pytorch bash -c "cd /workspace && python gpt.py"
else
    docker run  --rm -it -v `pwd`:/opt/work/  --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864  mebusy/nv_torch_gym  python gpt.py
fi

