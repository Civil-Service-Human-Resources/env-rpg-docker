# Maven base image - used in multi stage builds 
FROM    maven:3-jdk-8-slim

# Add build labels to identify where image came from
ARG	arg_build_date
ARG	arg_build_branch
ARG	arg_build_project
ARG	arg_built_by
LABEL 	uk.cshr-gov.build.build-date=$arg_build_date \
	uk.cshr-gov.build.build-branch=$arg_build_branch \
	uk.cshr-gov.build.built-project=$arg_build_project \
	uk.cshr-gov.build.built-by=$arg_built_by 

RUN     apt-get update && \
        apt-get upgrade -y