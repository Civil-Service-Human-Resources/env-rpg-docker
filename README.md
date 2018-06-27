# env-rpg-docker

A set of base docker images to be used by RPG project.

Initially we will take base images available on Docker Hub and update them as required.  In the future we may build our own base images.

These images should be built and updated nightly.

## Usage

### java-8-base

Create java image by using java-8-base and copying your jar to the /app directory.

* Ensure the application is copied to the /app directory
* Ensure the appuser is the user that runs the container
* Ensure the application writes logs to /logs, or a subdirectory of /logs

Example:

```
FROM    cshrrpg.azurecr.io/java-8-base:latest

COPY 	./my-application-1.0.jar /app/my-application-1.0.jar

USER 	appuser

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/my-application-1.0.jar"]
```

### java-8-base-filebeat

Due to some problems with the deployment platform, it is necessary to bundle filebeat with the application, in order to enable logging.  This is a temporary solution, but until the problem is resolved, applications that require logging to ELK will need to use this image, then implement an entrypoint.sh file, example:

```
#! /bin/bash

echo "cshr-application: In entrypoint.sh"

echo "entrypoint.sh: command passed: " ${1}

if [[ ${#} -eq 0 ]]; then
    # -E to preserve the environment
    echo "Starting filebeat"
    sudo -E filebeat -e -c /etc/filebeat/filebeat.yml &
    echo "Starting application"
    java -Djava.security.egd=file:/dev/./urandom -jar /app/cshr-application.jar \
            --spring.profiles.active=${SPRING_PROFILES_ACTIVE} \
            
else
    echo "Running command:"
    exec "$@"
fi
```

The filebeat service expects the following environment variables:

| Variable              | Description                                                           | Example   |
|---                    |---                                                                    |---        |
| FILEBEAT_PLATFORM     | The platform (cloud or otherwise) on which the service is running     | AWS or Azure  |
| FILEBEAT_ENVIRONMENT  | The environment                                                       | DEV or TEST or PROD  |
| FILEBEAT_COMPONENT    | A way to identify the service that is logging                         | Application_name    |
| FILEBEAT_HOSTS        | A list of hosts to which the filebeat service will send logs          | myhost.logit.io:182821  |

### maven-3-base

This image can be used as detailed in the DockerHub documentation:

	
Here: [Maven Documentation](https://hub.docker.com/_/maven/ "Maven Documentation")






