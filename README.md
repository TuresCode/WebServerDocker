
# WebServerDocker: A Lightweight GPU-Powered Docker Container
```markdown
This project provides a streamlined, GPU-enabled Docker container designed as a more efficient alternative to larger Kaggle images. We leverage the official TensorFlow Docker image ([https://www.tensorflow.org/install/docker](https://www.tensorflow.org/install/docker)) and build upon it with a custom Dockerfile, allowing for modifications during the build process.

## Key Features

* **GPU Acceleration:**  Leverages your system's GPU for accelerated computations.
* **Customization:**  The Dockerfile allows for easy customization and integration of your specific scripts and dependencies.
* **Lightweight:**  Designed to be more efficient and resource-friendly than bulky Kaggle images.
* **Entrypoint Script:** Executes a predefined script when the container starts, streamlining your workflow.

## How It Works

This project uses a Dockerfile to build a customized image based on the official TensorFlow image. This Dockerfile includes an entrypoint script (`entrypoint.sh`) that is executed when the container starts. This allows you to automatically run your desired application or script within the container.

## Building the Docker Image

To build the Docker image, simply navigate to the project directory and execute the following command:

```bash
docker build -t demo-dockerflask:latest .
```

## Running the Docker Container

Once the image is built, you can start a container with the following command:

```bash
docker run -d --restart unless-stopped -it --gpus all -p 7005:7005 demo-dockerflask:latest
```

This command does the following:

* **`-d`:** Runs the container in detached mode (background).
* **`--restart unless-stopped`:** Restarts the container automatically unless explicitly stopped.
* **`-it`:**  Allocates a pseudo-TTY connected to the container's stdin and creates an interactive bash shell in the container.
* **`--gpus all`:** Makes all available GPUs accessible to the container.
* **`-p 7005:7005`:**  Maps port 7005 on the host machine to port 7005 in the container.
* **`demo-dockerflask:latest`:** Specifies the name and tag of the Docker image to use.

## Getting Started

1. Clone this repository.
2. Modify the Dockerfile and entrypoint.sh to suit your specific needs.
3. Build the Docker image using the provided command.
4. Run the container and access your application!
```
