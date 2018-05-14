# env-rpg-docker

A set of base docker images to be used by RPG project.

Initially we will take base images available on Docker Hub and update them as required.  In the future we may build our own base images.

These images should be built and updated nightly.

## Usage

### java-8-base

Create java image by using java-8-base and copying your jar to the /app directory.

* Ensure the application is copied to the /app directory
* Ensure the appuser is the user that runs the container

Example:

```
FROM    cshrrpg.azurecr.io/java-8-base:latest

COPY 	./my-application-1.0.jar /app/my-application-1.0.jar

USER 	appuser

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/my-application-1.0.jar"]
```

