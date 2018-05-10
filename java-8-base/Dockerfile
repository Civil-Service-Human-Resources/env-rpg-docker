# From standard docker hub openJDK 8 - debian
FROM    openjdk:8-jre-slim

# Add build labels to identify where image came from
ARG	arg_build_branch
ARG	arg_build_project
ARG	arg_built_by
LABEL 	uk.cshr-gov.build.build-branch=$arg_build_branch uk.cshr-gov.build.built-project=$arg_build_project uk.cshr-gov.build.built-by=$arg_built_by

RUN     rm /usr/bin/perl*

# Update all dependencies
RUN     apt-get update && \
        apt-get upgrade -y

# User under which the application can run
RUN     useradd -s /sbin/nologin appuser

# Directory to install jar file
RUN     mkdir /app && chown appuser:appuser /app

