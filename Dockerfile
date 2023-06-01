FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update \
    && apt-get install -y curl iproute2 sshfs unzip less groff

# Install kubectl
RUN curl -LO https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

# Clean up
RUN rm -rf awscliv2.zip aws

# Set PATH to include kubectl and AWS CLI
ENV PATH="/usr/local/bin:${PATH}"

# Your additional configuration and commands go here, if any

CMD ["/bin/bash"]
