# Use an official PyTorch image as the base image
FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-runtime
# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    vim

# Install Jupyter
RUN pip install jupyter

# Install FastAI
RUN pip install fastai

# Install Fastbook
RUN pip install fastbook

# Install voila
RUN pip install voila


# Set working directory
WORKDIR /workspace

# Expose the Jupyter port
EXPOSE 8888 8866 8867

# Start Jupyter notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

# Start both Jupyter notebook and Voila servers
#CMD ["bash", "-c", "jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser & voila --port=8866 /workspace/fastbook/my_plot.ipynb"]

# Start Voila server
# CMD ["voila", "--port=8866", "/workspace/fastbook/my_plot.ipynb"]