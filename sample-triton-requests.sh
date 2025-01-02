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


# Test base ensemble model without a lora.
curl -X POST localhost:8000/v2/models/ensemble/generate -d '{"text_input": "What is machine learning?", "max_tokens": 20, "bad_words": "", "stop_words": ""}'; 
echo

# This is the expected output
# {"model_name":"ensemble","model_version":"1","sequence_end":false,"sequence_id":0,"sequence_index":0,"sequence_start":false,"text_output":"What is machine learning? Machine learning is a branch of artificial intelligence that allows computers to learn without being explicitly programmed. Machine"}

