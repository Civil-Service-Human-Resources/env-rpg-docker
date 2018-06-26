# We need to override the entrypoint file to add some specific variables.
FROM wordpress:4.9.4-php7.0-apache

ARG     arg_build_branch
ARG     arg_build_workspace
ARG     arg_build_project
ARG     arg_built_by
LABEL   digital.cshr.build-branch=$arg_build_branch \
        digital.cshr.build-workspace=$arg_build_workspace \
        digital.cshr.built-project=$arg_build_project \
        digital.cshr.built-by=$arg_built_by

COPY docker-entrypoint.sh /usr/local/bin/
