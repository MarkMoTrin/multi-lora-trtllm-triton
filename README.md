# HTTP Multi-lora with TRT-LLM+Triton
This sample repo is meant to showcase how to deploy multiple loras using the HTTP generate endpoint in Triton+TRT-LLM. The example is built with TP=1 (1-GPU), but should work for multi-gpu examples.
It is an extension to the Lora deployment example [here](https://github.com/triton-inference-server/tensorrtllm_backend/blob/main/docs/lora.md).

**Triton version** 24.11 - Best to pull the container from [NGC](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/tritonserver/tags) (NVIDIA GPU CLOUD).  
`nvcr.io/nvidia/tritonserver:24.11-trtllm-python-py3`  

[**TRT-LLM version**](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/tritonserver/tags): 0.15.0  

[**TensorRTLLM Backend**](https://github.com/triton-inference-server/tensorrtllm_backend/tree/v0.15.0): 0.15.0  

See the [framework compatibility matrix](https://docs.nvidia.com/deeplearning/frameworks/support-matrix/index.html) to see what versions of packages are shipped with Triton

### High-level steps
The high-level steps are as follows and correspond mostly to the scripts in the repo:

- Setup the repo with various folders: models, engines, loras, and model_repo (for Triton)
- Use the Triton-TRTLLM container; no installation of TRT-LLM is needed. Make sure to deploy with the same TRT-LLM version that the model is built with. TRT-LLM >0.15.0
- Build engine for the base model
- Download Lora weights
- Convert Lora weights to a format that works with the TRT-LLM backend
- Download the TRT-LLM backend repo
- Configure the TRT-LLM backend
- Deploy the base model in Triton
- Use the python client (in the Triton py3-sdk container) to send the lora weights to be loaded into Triton
- Query individual models in Triton with Lora ids 



`
git clone -b v0.15.0 https://github.com/triton-inference-server/tensorrtllm_backend.git
`
