# ------------------------------------------------------------------------------------------
# Launch Triton SDK Container for loading loras
# ------------------------------------------------------------------------------------------

# Define variables
TRT_LLM_BACKEND_PATH="$(pwd)/tensorrtllm_backend"       # Relative path to tensorrtllm_backend
HUGGING_FACE_CACHE_PATH="${HOME}/.cache/huggingface"    # Hugging Face cache directory
PATH_TO_ENGINE="$(pwd)/engines"                         # Relative path to engines
WORKSPACE_PATH="$(pwd)"                                 # Relative path to workspace
SPECIFIC_GPU=1                                          # GPU device ID
DOCKER_TAG="24.11"                                      # Version tag for the Docker image

# Run the Docker command with the version tag variable
docker run --rm -it --net host --pid=host --ipc=host --shm-size=10g \
    --ulimit memlock=-1 --ulimit stack=67108864 \
    -v "$TRT_LLM_BACKEND_PATH":/tensorrtllm_backend \
    -v "$HUGGING_FACE_CACHE_PATH":/root/.cache/huggingface \
    -v "$PATH_TO_ENGINE":/engines \
    -v "$WORKSPACE_PATH":/workspace \
    nvcr.io/nvidia/tritonserver:${DOCKER_TAG}-py3-sdk




# --------------------------------------------------------------------------

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
    --ulimit memlock=-1 --ulimit stack=67108864 --gpus "device=2"\
    -v "$TRT_LLM_BACKEND_PATH":/tensorrtllm_backend \
    -v "$HUGGING_FACE_CACHE_PATH":/root/.cache/huggingface \
    -v "$PATH_TO_ENGINE":/engines \
    -v "$WORKSPACE_PATH":/workspace \
    nvcr.io/nvidia/tritonserver:${DOCKER_TAG}-py3-sdk


# Run the Docker command with the version tag variable
docker run --rm -it --net host --pid=host --ipc=host --shm-size=10g \
    --ulimit memlock=-1 --ulimit stack=67108864 --gpus "device=2"\
    -v "$TRT_LLM_BACKEND_PATH":/tensorrtllm_backend \
    -v "$HUGGING_FACE_CACHE_PATH":/root/.cache/huggingface \
    -v "$PATH_TO_ENGINE":/engines \
    -v "$WORKSPACE_PATH":/workspace \
    nvcr.io/nvidia/tritonserver:${DOCKER_TAG}-py3-sdk





docker run -ti --gpus all --network=host --pid=host --ipc=host -v $HOME:/mnt -v /data:/data nvcr.io/nvidia/tritonserver:${VERSION}-py3-sdk

curl localhost:8000/v2/models



# Define variables
TRT_LLM_BACKEND_PATH="$(pwd)/tensorrtllm_backend"       # Relative path to tensorrtllm_backend
HUGGING_FACE_CACHE_PATH="${HOME}/.cache/huggingface"    # Hugging Face cache directory
PATH_TO_ENGINE="$(pwd)/engines"                         # Relative path to engines
WORKSPACE_PATH="$(pwd)"                                 # Relative path to workspace
SPECIFIC_GPU=1                                          # GPU device ID
DOCKER_TAG="24.11"                                      # Version tag for the Docker image

# Run the Docker command with the version tag variable
docker run --rm -it --net host --shm-size=2g \
    --ulimit memlock=-1 --ulimit stack=67108864 \
    -v "$TRT_LLM_BACKEND_PATH":/tensorrtllm_backend \
    -v "$HUGGING_FACE_CACHE_PATH":/root/.cache/huggingface \
    -v "$PATH_TO_ENGINE":/engines \
    -v "$WORKSPACE_PATH":/workspace \
    nvcr.io/nvidia/tritonserver:${DOCKER_TAG}-trtllm-python-py3



# ---------------------------------------------------------------------------------

SPECIFIC_GPU=1                            # Set to the GPU number you see from nvidia-smi otherwise use all. -1 uses all GPUs


# Define variables
TRT_LLM_BACKEND_PATH="$(pwd)/tensorrtllm_backend"       # Relative path to tensorrtllm_backend
HUGGING_FACE_CACHE_PATH="${HOME}/.cache/huggingface"    # Hugging Face cache directory
PATH_TO_ENGINE="$(pwd)/engines"                         # Relative path to engines
WORKSPACE_PATH="$(pwd)"                                 # Relative path to workspace
SPECIFIC_GPU=1                                          # GPU device ID
DOCKER_TAG="24.11"                                      # Version tag for the Docker image

# Run the Docker command with the version tag variable
docker run --rm -it --net host --shm-size=10g \
    --ulimit memlock=-1 --ulimit stack=67108864 --gpus "device=${SPECIFIC_GPU}" \
    -v "$TRT_LLM_BACKEND_PATH":/tensorrtllm_backend \
    -v "$HUGGING_FACE_CACHE_PATH":/root/.cache/huggingface \
    -v "$PATH_TO_ENGINE":/engines \
    -v "$WORKSPACE_PATH":/workspace \
    nvcr.io/nvidia/tritonserver:${DOCKER_TAG}-trtllm-python-py3




git-lfs clone https://huggingface.co/silk-road/luotuo-lora-7b-0.1
git-lfs clone https://huggingface.co/kunishou/Japanese-Alpaca-LoRA-7b-v0


# NVML could give you an error. Stop the container and relaunch it.

/tensorrtllm_backend/tensorrt_llm/examples
python3 /tensorrtllm_backend/tensorrt_llm/examples/hf_lora_convert.py -i luotuo-lora-7b-0.1 -o luotuo-lora-7b-0.1-weights --storage-type float16

python3 /tensorrtllm_backend/tensorrt_llm/examples/hf_lora_convert.py -i /workspace/loras/Japanese-Alpaca-LoRA-7b-v0 -o /workspace/loras/Japanese-Alpaca-LoRA-7b-v0-weights --storage-type float16



git clone https://huggingface.co/meta-llama/Llama-2-7b-hf

# Local model directory 
/home/mmoyou/Documents/customer-code/walmart-multi-lora/models/Llama-2-7b-hf


docker run --rm -it --net host --shm-size=2g \
    --ulimit memlock=-1 --ulimit stack=67108864 --gpus all \
    -v </path/to/tensorrtllm_backend>:/tensorrtllm_backend \
    -v ${HOME}/.cache/huggingface:/root/.cache/huggingface \
    -v </path/to/engines>:/engines \
    nvcr.io/nvidia/tritonserver:<xx.yy>-trtllm-python-py3




# Step 1
git clone -b v0.15.0 https://github.com/triton-inference-server/tensorrtllm_backend.git
cd tensorrtllm_backend
git submodule update --init --recursive
git lfs install
git lfs pull


SPECIFIC_GPU=1                            # Set to the GPU number you see from nvidia-smi otherwise use all. -1 uses all GPUs

export SPECIFIC_GPU

docker run --rm -it --net host --shm-size=2g \
    --ulimit memlock=-1 --ulimit stack=67108864 \
    -v $TRT_LLM_BACKEND_PATH:/tensorrtllm_backend \
    -v $HUGGING_FACE_CACHE_PATH:/root/.cache/huggingface \
    -v $PATH_TO_ENGINE:/engines \
    nvcr.io/nvidia/tritonserver:24.11-trtllm-python-py3



nvcr.io/nvidia/tritonserver:24.11-trtllm-python-py3

'"device='"$SPECIFIC_GPU"'"'

# ---------------------------------------------------------------------------------
# CHANGE Parameters ==== 
# ---------------------------------------------------------------------------------
PARAMS_DEBUG_FLAG=0                       # Set to 1 to double check the parameters, no NIM will be launched, set to 0 to launch NIM
SPECIFIC_GPU=1                            # Set to the GPU number you see from nvidia-smi otherwise use all. -1 uses all GPUs
CONTAINER_NAME=Llama3-1-8B-Instruct       # Name of the docker container running NIM
Repository=nim/meta/llama-3.1-8b-instruct # Use repository from querying models on NGC
Latest_Tag=1.3                            # Use tag from querying models on NGC           
NIM_SERVED_MODEL_NAME=custom_name_1       # Name of the model used in API request
LOCAL_NIM_CACHE=~/.cache/nim              # Directory where NIM downloads model files
MODEL_PROFILE_QUERY_OUTPUT=./outputs/model_profiles.txt           # Stores a list of available optimized models for a specific model
MODELS_AVAILABLE_CSV=./outputs/ngc_registry_image_list.csv  # Stores a csv of all downloadable models with tags

# Choose a LLM NIM Image from NGC
export IMG_NAME="nvcr.io/${Repository}:${Latest_Tag}"
export LOCAL_NIM_CACHE
export NIM_SERVED_MODEL_NAME
export MODEL_PROFILE_QUERY_OUTPUT
export MODELS_AVAILABLE_CSV
export SPECIFIC_GPU

mkdir -p "$LOCAL_NIM_CACHE" 


nvcr.io/nvidia/tritonserver:24.11-trtllm-python-py3
