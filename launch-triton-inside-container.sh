#!/bin/bash
# ---------------------------------------------------
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 12-19-24
# Usage:
#   This script launches Triton Inference Server 
#   inside the container
# ---------------------------------------------------

# This file has to be run inside of the TRT-LLM Triton Container

MODEL_FOLDER=/workspace/triton_model_repo
# 'world_size' is the number of GPUs you want to use for serving. This should
# be aligned with the number of GPUs used to build the TensorRT-LLM engine.
python3 /tensorrtllm_backend/scripts/launch_triton_server.py --world_size=1 --model_repo=${MODEL_FOLDER}