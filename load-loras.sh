#!/bin/bash
# ---------------------------------------------------
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 12-19-24
# Usage:
#   This script should be launched inside of the Triton
#   py3 sdk so send the requests
# ---------------------------------------------------




pip3 install tritonclient[all]

TASK_IDS=("1" "2")
# LORA_PATHS=("/workspace/loras/luotuo-lora-7b-0.1-weights" "/workspace/loras/Japanese-Alpaca-LoRA-7b-v0-weights")
LORA_PATHS=("luotuo-lora-7b-0.1-weights" "Japanese-Alpaca-LoRA-7b-v0-weights")
INFLIGHT_BATCHER_LLM_CLIENT=/workspace/tensorrtllm_backend/inflight_batcher_llm/client/inflight_batcher_llm_client.py
TOKENIZER_DIR=/workspace/models/Llama-2-7b-hf

for index in ${!TASK_IDS[@]}; do
    text="dummy"
    lora_path=${LORA_PATHS[$index]}
    task_id=${TASK_IDS[$index]}
    lora_arg="--lora-path ${lora_path} --lora-task-id ${task_id}"

    echo $lora_path

    python3 ${INFLIGHT_BATCHER_LLM_CLIENT} \
        --top-k 0 \
        --top-p 0.5 \
        --url "localhost:8001" \
        --request-output-len 10 \
        --text "${text}" \
        --tokenizer-dir ${TOKENIZER_DIR} \
        ${lora_arg} &
done



# pip3 install tritonclient[all]

# TASK_IDS=("1" "2")
# # LORA_PATHS=("/workspace/loras/luotuo-lora-7b-0.1-weights" "/workspace/loras/Japanese-Alpaca-LoRA-7b-v0-weights")
# LORA_PATHS=("luotuo-lora-7b-0.1-weights" "Japanese-Alpaca-LoRA-7b-v0-weights")
# INFLIGHT_BATCHER_LLM_CLIENT=/workspace/tensorrtllm_backend/inflight_batcher_llm/client/inflight_batcher_llm_client.py
# TOKENIZER_DIR=/workspace/models/Llama-2-7b-hf

# for index in ${!TASK_IDS[@]}; do
#     text="dummy"
#     lora_path=${LORA_PATHS[$index]}
#     task_id=${TASK_IDS[$index]}
#     lora_arg="--lora-path ${lora_path} --lora-task-id ${task_id}"

#     echo $lora_path

#     python3 ${INFLIGHT_BATCHER_LLM_CLIENT} \
#         --top-k 0 \
#         --top-p 0.5 \
#         --url "localhost:8001" \
#         --request-output-len 10 \
#         --text "${text}" \
#         --tokenizer-dir ${TOKENIZER_DIR} \
#         --model-name ensemble \
#         ${lora_arg} &
# done


# python3 /workspace/tensorrtllm_backend/inflight_batcher_llm/client/inflight_batcher_llm_client.py \
#         --top-k 0 \
#         --top-p 0.5 \
#         --request-output-len 10 \
#         --text "${text}" \
#         --tokenizer-dir ${TOKENIZER_DIR} \
#         --model-name ensemble \
#         --lora-path "luotuo-lora-7b-0.1-weights" \
#         --lora-task-id 1

# python3 /workspace/tensorrtllm_backend/inflight_batcher_llm/client/inflight_batcher_llm_client.py \
#         --top-k 0 \
#         --request-output-len 10 \
#         --text "${text}" \
#         --tokenizer-dir ${TOKENIZER_DIR} \
#         --model-name ensemble \
#         --lora-path "luotuo-lora-7b-0.1-weights" \
#         --lora-task-id 1