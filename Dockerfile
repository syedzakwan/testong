FROM ubuntu:16.04


#set environment
ENV http_proxy=http://proxy-chain.intel.com:911
ENV https_proxy=http://proxy-chain.intel.com:912
ENV ftp_proxy=http://proxy-chain.intel.com:911
ENV socks_proxy=http://proxy-chain.intel.com:1080
ENV no_proxy localhost,.intel.com,*.intel.com,10.0.0.0/8
ENV DEBIAN_FRONTEND noninteractive

ADD etc/profile /etc/profile

RUN cd /etc/apt && \
    touch apt.conf && \
    echo Acquire::http::Proxy "http://proxy-chain.intel.com:911"; >> /etc/apt/apt.conf

RUN cd /etc/apt && \
    echo Acquire::http::Proxy "http://proxy-chain.intel.com:912"; >> /etc/apt/apt.conf

#add local apt mirror

ADD apt/sources_ubuntu_16_04_local.list /etc/apt/sources.list



## install basic packages
RUN echo "nameserver 10.248.2.1" > /etc/resolv.conf && \
    echo "search png.intel.com" >> /etc/resolv.conf && \
    apt-get update

RUN echo "nameserver 10.248.2.1" > /etc/resolv.conf && \
    echo "search png.intel.com" >> /etc/resolv.conf && \
    apt-get install -y ca-certificates ccze curl htop \
    		       openssl python python-pip tcpdump  telnet \
    		       traceroute unzip vim zip sudo tmux && \
    echo "Default env_keep += \"http_proxy https_proxy no_proxy\"" >> /etc/sudoers


# PPA 





#install dependencies

RUN echo 

