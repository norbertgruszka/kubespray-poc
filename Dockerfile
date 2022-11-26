FROM python:3.10.6-slim

RUN apt-get update -y && \
apt-get install -y curl openssh-client sshpass

# Download Kubespray
RUN curl -LO "https://github.com/kubernetes-sigs/kubespray/archive/refs/tags/v2.20.0.tar.gz" \
    && mkdir /src/ \
    && tar -xzf "v2.20.0.tar.gz" -C /src \
    && mv /src/kubespray-* /src/kubespray
WORKDIR /src/kubespray/

# Install kubespray python requirements
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt
