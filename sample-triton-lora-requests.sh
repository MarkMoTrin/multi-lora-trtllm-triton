#!/bin/bash
# ---------------------------------------------------
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 01-02-25
# Usage:
#   This script has a sample curl command to send to Triton 
#   generate endpoint without a lora.
#   Read more about the endpoint here:
#   https://github.com/triton-inference-server/server/blob/main/docs/protocol/extension_generate.md
# ---------------------------------------------------


# Curl command to Lora Task ID 1
curl -X POST localhost:8000/v2/models/ensemble/generate -d '{"text_input": "华中师范大学在哪里？", "max_tokens": 50, "bad_words": "", "stop_words": "", "pad_id": 2, "end_id": 2, "lora_task_id": 1}' | jq

echo

# Curl command to the Lora Task ID 2
curl -X POST localhost:8000/v2/models/ensemble/generate -d '{"text_input": "华中师范大学在哪里？", "max_tokens": 50, "bad_words": "", "stop_words": "", "pad_id": 2, "end_id": 2, "lora_task_id": 2}' | jq

echo