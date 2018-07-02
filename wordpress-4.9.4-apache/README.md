# CSHR wordpress
As we want to pull in specific environment variables, we need to override the docker-entrypoint.sh that comes as standard and add the variables required.

```
GTM_CONTAINER_ID
GTM_ON
WP_DEBUG_DISPLAY
SAVEQUERIES
COOKIE_BANNER_COOKIE_NAME
MEDIA_LIMIT
MEDIA_LIMIT_LARGE
GO_NATIVE_KEY
GO_NATIVE_VAL
LOCKOUT_DURATION
USER_LOGIN_LIMIT
PREVIEW_LINK_DURATION
LOCKOUT_TRANS_NAME
AUTH_EXTEND_ON
AUTH_EXTEND_DURATION
AUTH_EXTEND_NONCE_KEY
AUTH_EXTEND_TOKEN_KEY
```

## How to add new variables

Variables need to be added in to the docker-entrypoint.sh script.  They will also need adding as an environment variable in to the script that starts the Wordpress docker image (this may be an Azure resource template, an AWS ECS template, Kubernetes config, docker compose file etc).

The docker-entrypoint.sh script expects environment variables to have `WORDPRESS_` prepended, but you do not need to prepend `WORDPRESS_` inside the docker-entrypoint.sh

In simple terms, when adding a new variable!:

* Add an environment variable to the deployment script `WORDPRESS_MY_NEW_VARIABLE`
* Add a variable to the docker-entrypoint.sh `MY_NEW_VARIABLE`

You can add a variable to the docker-entrypoint.sh as follows:

* Go to line 78 in docker-entrypoint file, there is an array of variables called:
```
	uniqueEnvs=(
		AUTH_KEY
		SECURE_AUTH_KEY
		LOGGED_IN_KEY
		NONCE_KEY
		AUTH_SALT
		SECURE_AUTH_SALT
		LOGGED_IN_SALT
		NONCE_SALT
		GTM_CONTAINER_ID
		GTM_ON
		WP_DEBUG_DISPLAY
		SAVEQUERIES
		COOKIE_BANNER_COOKIE_NAME
		MEDIA_LIMIT
		MEDIA_LIMIT_LARGE
		GO_NATIVE_KEY
		GO_NATIVE_VAL
		LOCKOUT_DURATION
		USER_LOGIN_LIMIT
		PREVIEW_LINK_DURATION
	)
```
* Navigate to the bottom of the array and add the new variable name and add the new variable - in this example the variable is `MY_NEW_VARIABLE`.
```
	uniqueEnvs=(
		AUTH_KEY
		SECURE_AUTH_KEY
		LOGGED_IN_KEY
		NONCE_KEY
		AUTH_SALT
		SECURE_AUTH_SALT
		LOGGED_IN_SALT
		NONCE_SALT
		GTM_CONTAINER_ID
		GTM_ON
		WP_DEBUG_DISPLAY
		SAVEQUERIES
		COOKIE_BANNER_COOKIE_NAME
		MEDIA_LIMIT
		MEDIA_LIMIT_LARGE
		GO_NATIVE_KEY
		GO_NATIVE_VAL
		LOCKOUT_DURATION
		USER_LOGIN_LIMIT
		PREVIEW_LINK_DURATION
        MY_NEW_VARIABLE
	)
```
* Push the branch back to git, raise a PR and merge to master branch.  This action will trigger a new build of the wordpress docker image in CircleCi.

## Location
Currently pushed to Azure Container Reg.
`cshrrpg.azurecr.io/wordpress-4.9.4-apache`

## docker-compose.yml

Docker compose can be used to run the Wordpress deployment locally, and test addition of variables to the docker-entrypoint.sh file.

Add the relevant new variable under `ENVIRONMENT` then run compose using 

`docker-compose up`

## TODO

* Review use of specific version of Wordpress image.
* Review CircleCi config file - there is a lot of repeated lines that could be made smarter.
