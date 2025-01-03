# Deployment Repo Overview

By the end of the tutorial, your deployment repo will look as follows. The remaning folders you don't see in the repo are generated as you go through the tutorial.

![alt text](./images/base-repo.png)

The engine folder below has the compiled version of the model showing the .engine file.

![alt text](./images/engines-folder.png)

The loras weights folders below get populated once you down convert the loras. The other 
folders represent the raw downloaded lora weights 

![alt text](./images/loras-folder.png)


The folder below shows model pulled from hugging face  
![alt text](./images/model-folder-huggingface.png)

The Tensorrtllm backend folder is downloaded directly with git clone and is used 
to configure the model repository that Triton will host.  
![alt text](./images/tensorrtllm-backend-folder.png)

The Triton Model Repo folder is populated once you configure the Tensorrtllm backend  
![alt text](./images/triton-model-repo-folder.png)
