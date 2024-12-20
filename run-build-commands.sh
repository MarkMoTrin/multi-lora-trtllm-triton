#!/bin/bash
# ---------------------------------------------------
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 12-19-24
# Usage:
#   This script launches Triton TRT-LLM container to build the engines
#   in the models.
# ---------------------------------------------------

cd /tensorrtllm_backend/tensorrt_llm/xamples/llama
BASE_LLAMA_MODEL=/workspace/models/Llama-2-7b-hf

python3 convert_checkpoint.py --model_dir ${BASE_LLAMA_MODEL} \
                            --output_dir ./c-model/llama/fp16/1-gpu \
                            --dtype float16