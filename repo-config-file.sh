#!/bin/bash
# ------------------------------------------------------------------------------
# Filename: repo-config-file.sh
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 01-02-25
# Usage:
#   This script holds all the configurations that will be used across scripts, 
#   so you configure once and run all the scripts.
# ------------------------------------------------------------------------------

# Path to the model from Hugging Face in this example
BASE_MODEL_PATH=/workspace/models/Llama-2-7b-hf

# Engine built from TRT-LLM compilation
ENGINE_DIR=/workspace/engines/llama_7b_with_lora_qkv/fp16/1-gpu
TOKENIZER_DIR=/workspace/models/Llama-2-7b-hf


# Set to the GPU number you see from nvidia-smi otherwise use all GPUs.
SPECIFIC_GPU=1                            


# Define variables
TRT_LLM_BACKEND_PATH="./tensorrtllm_backend"       # Relative path to tensorrtllm_backend
HUGGING_FACE_CACHE_PATH="${HOME}/.cache/huggingface"    # Hugging Face cache directory
PATH_TO_ENGINE="/workspace/engines"                         # Relative path to engines
WORKSPACE_PATH="/workspace"                                 # Relative path to workspace
DOCKER_TAG="24.11"                                      # Version tag for the Docker image


## Parameters for configuring the Triton Model Repository.
# Folder hosting the model to be deployed in Triton.
MODEL_FOLDER=/workspace/triton_model_repo
TRITON_MAX_BATCH_SIZE=4
INSTANCE_COUNT=1
MAX_QUEUE_DELAY_MS=0
MAX_QUEUE_SIZE=0
FILL_TEMPLATE_SCRIPT=/workspace/tensorrtllm_backend/tools/fill_template.py
DECOUPLED_MODE=false


# ------------------------------------------------------------------------------
# Used on load-loras.sh script
# ------------------------------------------------------------------------------
# The number of task IDs should match the number of Loras you have
TASK_IDS=("1" "2")
LORA_PATHS=("/workspace/loras/luotuo-lora-7b-0.1-weights" "/workspace/loras/Japanese-Alpaca-LoRA-7b-v0-weights")
INFLIGHT_BATCHER_LLM_CLIENT=/workspace/tensorrtllm_backend/inflight_batcher_llm/client/inflight_batcher_llm_client.py
