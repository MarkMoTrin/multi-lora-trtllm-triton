#!/bin/bash
# ------------------------------------------------------------------------------
# Filename: 6-run-triton-client-container.sh
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 01-02-25
# Usage:
#   This script launches Triton client container to send upload the lora weights
# ------------------------------------------------------------------------------


# Pull in the configs.
source repo-config-file.sh

echo "----------------------------------------"
echo "TRT_LLM_BACKEND_PATH is set to: $TRT_LLM_BACKEND_PATH"
echo "HUGGING_FACE_CACHE_PATH is set to: $HUGGING_FACE_CACHE_PATH"
echo "PATH_TO_ENGINE is set to: $PATH_TO_ENGINE"
echo "WORKSPACE_PATH is set to: $WORKSPACE_PATH"
echo "SPECIFIC_GPU is set to: $SPECIFIC_GPU"
echo "DOCKER_TAG is set to: $DOCKER_TAG"


# Run the Docker command with the version tag variable
docker run --rm -it --net host --pid=host --ipc=host --shm-size=10g \
    --ulimit memlock=-1 --ulimit stack=67108864 \
    -v "$TRT_LLM_BACKEND_PATH":/tensorrtllm_backend \
    -v "$HUGGING_FACE_CACHE_PATH":/root/.cache/huggingface \
    -v "$PATH_TO_ENGINE":/engines \
    -v "$WORKSPACE_PATH":/workspace \
    nvcr.io/nvidia/tritonserver:${DOCKER_TAG}-py3-sdk
