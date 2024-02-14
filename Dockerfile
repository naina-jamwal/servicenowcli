FROM --platform=linux/amd64 python:3.9.0

# Below are the packages and their purpose in this container:
#  - servicenowcli:  ServiceNow client API python libraries and CLI tool

WORKDIR /
COPY requirements.docker /tmp/requirements.docker

# add SSH key
RUN mkdir /root/.ssh && \
    chmod 700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts && \
    chmod 644 /root/.ssh/known_hosts
COPY id_rsa /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa

# install dependencies
RUN pip3 install -U pip==21.2.4 && \
    pip3 install -r /tmp/requirements.docker && \
    rm /tmp/requirements.docker && \ 
    rm /root/.ssh/known_hosts

ENV SN_USERNAME="s.ServiceNow.Ops"
ENV SN_PASSWORD='O},$^!LW$in[9DnWx~3n'
ENV SN_CLIENT_ID=56f2996ee65425947341dba155f71c1e
ENV SN_CLIENT_SECRET=Dc!]lq*zCM
ENV BASE_SERVICE_NOW_INSTANCE_URL=https://nikedev.service-now.com
