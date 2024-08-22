
# getting tensorflow base image
FROM tensorflow/tensorflow
RUN chmod 1777 /tmp
RUN apt-get update && \
    apt-get install git -y && \
    apt-get install wget -y && \
    apt-get install vim -y && \
    apt-get install nano -y
WORKDIR /flask_server
COPY /app .
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the entrypoint script and Python script into the image
COPY entrypoint_new.sh .
# Set the entrypoint script as executable
RUN chmod +x entrypoint_new.sh


# Set the entrypoint to execute the script
ENTRYPOINT ["/flask_server/entrypoint_new.sh", "/bin/bash"]

