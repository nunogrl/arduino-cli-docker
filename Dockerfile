FROM python:3.11-slim
RUN apt-get update && apt-get install -y curl unzip make jq && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
COPY arduino-cli.yaml /root/.arduino15/arduino-cli.yaml
COPY Makefile.container /opt/arduino/Makefile
WORKDIR /workspace
# ENTRYPOINT ["make", "-f", "/opt/arduino/Makefile"]
CMD ["tail", "-f", "/dev/null"]
