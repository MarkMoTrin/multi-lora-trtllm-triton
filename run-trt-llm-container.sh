#!/bin/bash
# ---------------------------------------------------
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 12-19-24
# Usage:
#   This script launches Triton TRT-LLM container to build the engines
#   in the models.
# ---------------------------------------------------



SPECIFIC_GPU=1                            # Set to the GPU number you see from nvidia-smi otherwise use all. -1 uses all GPUs


# Define variables
TRT_LLM_BACKEND_PATH="$(pwd)/tensorrtllm_backend"       # Relative path to tensorrtllm_backend
HUGGING_FACE_CACHE_PATH="${HOME}/.cache/huggingface"    # Hugging Face cache directory
PATH_TO_ENGINE="$(pwd)/engines"                         # Relative path to engines
WORKSPACE_PATH="$(pwd)"                                 # Relative path to workspace
SPECIFIC_GPU=1                                          # GPU device ID
DOCKER_TAG="24.11"                                      # Version tag for the Docker image

# Run the Docker command with the version tag variable
docker run --rm -it --net host --pid=host --ipc=host --shm-size=10g \
    --ulimit memlock=-1 --ulimit stack=67108864 --gpus "device=${SPECIFIC_GPU}" \
    -v "$TRT_LLM_BACKEND_PATH":/tensorrtllm_backend \
    -v "$HUGGING_FACE_CACHE_PATH":/root/.cache/huggingface \
    -v "$PATH_TO_ENGINE":/engines \
    -v "$WORKSPACE_PATH":/workspace \
    nvcr.io/nvidia/tritonserver:${DOCKER_TAG}-trtllm-python-py3