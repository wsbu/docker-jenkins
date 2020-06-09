FROM jenkins/jenkins:lts
USER root

# Install the latest Docker CE binaries
RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      nodejs \
      npm \
      gnupg2 \
      python \
      python-pip \
      python-tk \
      pylint \
      software-properties-common \
      zip && \
    pip install behave json2html && \
    npm install -g @angular/cli && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce

