#!/bin/bash
# Install kale, either from git or local files.

cd /home/jovyan

# If KALE_SRC is not set, then pull from git.
if [[ -z ${KALE_SRC} ]]
then
    git clone https://github.com/Jupyter-Kale/kale && cd kale

    # Add Oliver's and Matt's forks as remotes
    git remote add oliver https://github.com/OliverEvans96/kale
    git remote add matt https://github.com/mlhenderson/jupyter_hpc

    # Checkout specific version
    git checkout 83398b1
else
    # Otherwise, the local dev files should already be in place.
    cd kale
fi

# Development install
pip install -e .

# Find notebooks foldnb_folder=$(find ${KALE_SRC} -name notebooks)
nb_folder=$(find /home/jovyan/kale -name notebooks)
ln -s ${nb_folder} /home/jovyan/work/examples
