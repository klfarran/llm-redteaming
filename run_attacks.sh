#!/bin/bash
set -e

# get python 
module load miniforge 
module load cuda

# venv for pip installs 
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate

pip install --upgrade pip
pip install torch transformers pyyaml accelerate

echo ""
echo "Running attacks with no defenses"
python3 attack_pipeline.py

echo ""
echo "Running attacks with defense 1: input sanitization"
python3 attack_pipeline.py -defense 1 

echo ""
echo "Running attacks with defense 2: input isolation"
python3 attack_pipeline.py -defense 2