#!/bin/bash
# ------------------------------------------------------------------------------
# Filename: 2-run-build-commands.sh
# Author: Mark Moyou - mmoyou@nvidia.com
# Credit: Olga Andeeva - NVIDIA
# Date: 01-03-25
# Usage:
#   This script launches executes the build commands to build engine files and 
#   convert LoRAs to a format that TRT-LLM can consume. Edit the output paths
#   in the trtllm-build command to match your needs.
# ------------------------------------------------------------------------------

cd /tensorrtllm_backend/tensorrt_llm/examples/llama

source /workspace/repo-config-file.sh

echo "----------------------------------------"
echo "Running file $0"
echo "BASE_MODEL_PATH: $BASE_MODEL_PATH"

# Convert the base model into a format that TRT-LLM can consume
python3 convert_checkpoint.py --model_dir ${BASE_MODEL_PATH} \
                            --output_dir ./c-model/llama/fp16/1-gpu \
                            --dtype float16

### EDIT #######
#  Build the engine with TRT-LLM - edit the paramters to match your needs
trtllm-build --checkpoint_dir ./c-model/llama/fp16/1-gpu \
            --output_dir /engines/llama_7b_with_lora_qkv/fp16/1-gpu \
            --gemm_plugin float16 \
            --max_batch_size 8 \
            --max_seq_len 562 \
            --gpt_attention_plugin float16 \
            --kv_cache_type paged \
            --remove_input_padding enable \
            --use_paged_context_fmha enable \
            --lora_plugin float16 \
            --lora_target_modules attn_q attn_k attn_v \
            --max_lora_rank 8                            

# Convert the first lora using absolute paths. 
python3 /tensorrtllm_backend/tensorrt_llm/examples/hf_lora_convert.py -i \
        /workspace/loras/luotuo-lora-7b-0.1 -o \
        /workspace/loras/luotuo-lora-7b-0.1-weights --storage-type float16

python3 /tensorrtllm_backend/tensorrt_llm/examples/hf_lora_convert.py -i \
        /workspace/loras/Japanese-Alpaca-LoRA-7b-v0 -o \
        /workspace/loras/Japanese-Alpaca-LoRA-7b-v0-weights --storage-type float16

# Double check that you are in the right directory in case this line does not run.
python3 ../hf_lora_convert.py -i Japanese-Alpaca-LoRA-7b-v0 -o Japanese-Alpaca-LoRA-7b-v0-weights --storage-type float16
