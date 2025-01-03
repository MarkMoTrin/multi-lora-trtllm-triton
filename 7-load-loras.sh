#!/bin/bash
# ------------------------------------------------------------------------------
# Filename: 7-load-loras.sh
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 01-03-25
# Usage:
#   This script should be launched inside of the Triton py3 sdk. It loads the 
#   Lora adapters by sending them in the request to the Triton server. It uses 
#   python client to do this. Note that the model name is not specified due to
#   Triton's current configuration.
#
#   The setting for model would be --model-name <insert-model-name>
#   Running the script in its current form will look for the model currently 
#   loaded in the Triton server. Note this should only be one model.

#   This script should only be run once as it loads the loras then you can make 
#   separate curl requests to the Triton server to test the loras.
# ------------------------------------------------------------------------------


# Install the Triton client in case any updates are needed
pip3 install tritonclient[all]


# Pull in the configs.
source repo-config-file.sh

echo "----------------------------------------"
echo "TASK_IDS are set to: ${TASK_IDS[@]}"
echo "LORA_PATHS are set to: ${LORA_PATHS[@]}"
echo "INFLIGHT_BATCHER_LLM_CLIENT is set to: $INFLIGHT_BATCHER_LLM_CLIENT"
echo "TOKENIZER_DIR is set to: $TOKENIZER_DIR"


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
