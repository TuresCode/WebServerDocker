# getting tensorflow base image
FROM tensorflow/tensorflow
RUN apt-get update && \
    apt-get install git -y && \
    apt-get install wget -y && \
    apt-get install vim -y && \
    apt-get install graphviz -y && \
    apt-get install nano -y
WORKDIR /flask_server
COPY /app .
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the entrypoint script and Python script into the image
COPY entrypoint_new.sh .
# Set the entrypoint script as executable
RUN chmod +x entrypoint_new.sh

#To allow for docking to work we would need Meeko, ADFRsuite docking script and vina
#ADFRsuite
RUN wget https://ccsb.scripps.edu/adfr/download/1028/
RUN chmod a+x ADFRsuite_Linux-x86_64_1.0_install
RUN ./ADFRsuite_Linux-x86_64_1.0_install

#Vina
RUN wget https://github.com/ccsb-scripps/AutoDock-Vina/releases/download/v1.2.3/vina_1.2.3_linux_x86_64




# Set the entrypoint to execute the script
ENTRYPOINT ["/flask_server/entrypoint_new.sh", "/bin/bash"]

