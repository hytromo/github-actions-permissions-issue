# directory where all the extra executables are installed
ARG LOCAL_EXECS_DIR=/.bin

FROM ubuntu:22.04 as install-step

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get --yes install curl unzip

# need to restate the args here because they are not available in each state otherwise
ARG LOCAL_EXECS_DIR
ENV LOCAL_EXECS_DIR=$LOCAL_EXECS_DIR

WORKDIR /cicd

COPY install_tools.sh .
RUN bash ./install_tools.sh

FROM scratch

ARG LOCAL_EXECS_DIR
ENV LOCAL_EXECS_DIR=$LOCAL_EXECS_DIR

COPY --from=install-step ${LOCAL_EXECS_DIR} ${LOCAL_EXECS_DIR}
