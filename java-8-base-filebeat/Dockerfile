# From the rpg java base image
FROM    cshrrpg.azurecr.io/java-8-base

# Add build labels to identify where image came from
ARG		arg_build_date
ARG		arg_build_branch
ARG		arg_build_project
ARG		arg_built_by
LABEL 	uk.cshr-gov.build.build-date=$arg_build_date \
		uk.cshr-gov.build.build-branch=$arg_build_branch \
		uk.cshr-gov.build.built-project=$arg_build_project \
		uk.cshr-gov.build.built-by=$arg_built_by 

USER 	root

# Install dependencies for filebeat
# https://www.elastic.co/guide/en/beats/filebeat/current/setup-repositories.html
RUN 	apt-get update && \
        apt-get upgrade -y && \
		apt-get install wget -y && \
		apt-get install gnupg2 -y && \
		apt-get install apt-transport-https -y


RUN		wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN 	echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list

# Update all dependencies and install filebeat
RUN     apt-get update && \
		apt-get install filebeat=6.2.4 -y

COPY 	./filebeat.yml /etc/filebeat/filebeat.yml
RUN		chmod 644 /etc/filebeat/filebeat.yml

# Allow app user to run sudo filebeat
RUN 	apt-get install sudo -y && \
		echo "#Allow appuser to run filebeat" >> /etc/sudoers.d/filebeat && \
		echo "appuser ALL=(root) NOPASSWD:SETENV: /usr/bin/filebeat -e -c /etc/filebeat/filebeat.yml" >> /etc/sudoers.d/filebeat

# Remove perl as per security requirement
RUN     rm /usr/bin/perl*
