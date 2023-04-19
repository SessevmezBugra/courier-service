FROM 3.9.1-amazoncorretto-20 as backend-build
WORKDIR /courier/backend
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src src
RUN mvn install -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)


FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 8060
ARG DEPENDENCY=/courier/backend/target/dependency
COPY --from=backend-build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=backend-build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=backend-build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.migros.courier.CourierServiceApplication"]