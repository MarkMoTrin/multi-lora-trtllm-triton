#!/bin/bash
# ---------------------------------------------------
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 12-19-24
# Usage:
#   This script modifies the Model Configuration file
# ---------------------------------------------------

# This file has to be run inside of the TRT-LLM Triton Container

# ENGINE_DIR=/workspace/engines/llama_7b_with_lora_qkv/fp16/1-gpu
# TOKENIZER_DIR=/workspace/models/Llama-2-7b-hf
# MODEL_FOLDER=/workspace/triton_model_repo
# TRITON_MAX_BATCH_SIZE=4
# INSTANCE_COUNT=1
# MAX_QUEUE_DELAY_MS=0
# MAX_QUEUE_SIZE=0
# FILL_TEMPLATE_SCRIPT=/workspace/tensorrtllm_backend/tools/fill_template.py
# DECOUPLED_MODE=false

source repo-config-file.sh

echo "----------------------------------------"
echo "ENGINE_DIR is set to: $ENGINE_DIR"
echo "TOKENIZER_DIR is set to: $TOKENIZER_DIR"
echo "MODEL_FOLDER is set to: $MODEL_FOLDER"
echo "TRITON_MAX_BATCH_SIZE is set to: $TRITON_MAX_BATCH_SIZE"
echo "INSTANCE_COUNT is set to: $INSTANCE_COUNT"
echo "MAX_QUEUE_DELAY_MS is set to: $MAX_QUEUE_DELAY_MS"
echo "MAX_QUEUE_SIZE is set to: $MAX_QUEUE_SIZE"
echo "FILL_TEMPLATE_SCRIPT is set to: $FILL_TEMPLATE_SCRIPT"
echo "DECOUPLED_MODE is set to: $DECOUPLED_MODE"


python3 ${FILL_TEMPLATE_SCRIPT} -i ${MODEL_FOLDER}/ensemble/config.pbtxt triton_max_batch_size:${TRITON_MAX_BATCH_SIZE}
python3 ${FILL_TEMPLATE_SCRIPT} -i ${MODEL_FOLDER}/preprocessing/config.pbtxt tokenizer_dir:${TOKENIZER_DIR},triton_max_batch_size:${TRITON_MAX_BATCH_SIZE},preprocessing_instance_count:${INSTANCE_COUNT}
python3 ${FILL_TEMPLATE_SCRIPT} -i ${MODEL_FOLDER}/tensorrt_llm/config.pbtxt triton_backend:tensorrtllm,triton_max_batch_size:${TRITON_MAX_BATCH_SIZE},decoupled_mode:${DECOUPLED_MODE},engine_dir:${ENGINE_DIR},max_queue_delay_microseconds:${MAX_QUEUE_DELAY_MS},batching_strategy:inflight_fused_batching,max_queue_size:${MAX_QUEUE_SIZE},encoder_input_features_data_type:TYPE_FP16
python3 ${FILL_TEMPLATE_SCRIPT} -i ${MODEL_FOLDER}/postprocessing/config.pbtxt tokenizer_dir:${TOKENIZER_DIR},triton_max_batch_size:${TRITON_MAX_BATCH_SIZE},postprocessing_instance_count:${INSTANCE_COUNT},max_queue_size:${MAX_QUEUE_SIZE}
python3 ${FILL_TEMPLATE_SCRIPT} -i ${MODEL_FOLDER}/tensorrt_llm_bls/config.pbtxt triton_max_batch_size:${TRITON_MAX_BATCH_SIZE},decoupled_mode:${DECOUPLED_MODE},bls_instance_count:${INSTANCE_COUNT}