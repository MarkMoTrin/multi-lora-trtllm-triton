#!/bin/bash
# ------------------------------------------------------------------------------
# Filename: 4-launch-triton-inside-container.sh
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 01-03-25
# Usage:
#   This script launches Triton Inference Server inside the container Triton 
#   TRT-LLM container. 
# ------------------------------------------------------------------------------

# This file has to be run inside of the Triton TRTLLM Container (not the SDK container)

source repo-config-file.sh

echo "----------------------------------------"
echo "Running file $0"
echo "MODEL_FOLDER: $MODEL_FOLDER"

# # 'world_size' is the number of GPUs you want to use for serving. This should
# # be aligned with the number of GPUs used to build the TensorRT-LLM engine.
python3 /tensorrtllm_backend/scripts/launch_triton_server.py --world_size=1 --model_repo=${MODEL_FOLDER}