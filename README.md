# Courier Service

## Tech Stack
- Java JDK 20
- Maven 
- Docker 
- Docker-Compose
- Redis
- Keycloak
- MySQL
- Spring

### How to Run:
- You have to be in same path with docker-compose-local.yml file
- Run docker-compose -p "courier-docker-compose" --file ./docker-compose-local.yml up -d

### Notice these
 - First run will take long time because of dependencies
 - If you wish run the project in a tool such as STS, you can add comment to courier-service container in docker-compose file. Yet it is necessary to run all other containers.

 ### How to Test:
 - Go http://localhost:8080/swagger-ui/index.html
 - Authorize and select email scope
 - Authenticate username: test-user@gmail.com and pass: test1234
 - Thanks to dump files stores already exists in db so you can call api to see them
 - /courier-location end point helps you to start or change your courier location
 - you can track informations about relations of courier and store in logs
 - /courier-travel-detail At the end of the day you can see how distance your courier take
