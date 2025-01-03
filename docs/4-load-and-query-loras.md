# Load and Query Loras 

Launch a second terminal and run the `6-run-triton-client-container.sh` script. This will launch a Triton client container to load the Lora weights into Triton.

Once inside the container, run `7-load-loras.sh`. This will load the loras in a single request. After that, you do not need to load the loras like this again.

A successful loading should look like below.

![alt text](./images/loras-loaded.png)

Now you can query the Loras using `8-sample-triton-lora-requests.sh`

![alt text](./images/successful-lora-query.png)
