FROM ghcr.io/graalvm/native-image:ol8-java11 AS builder
WORKDIR /home/app
COPY . /home/app
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
RUN ./mvnw -T 1C package -Dpackaging=native-image -Pgraalvm


FROM frolvlad/alpine-glibc:alpine-3.12
RUN apk update && apk add libstdc++
COPY --from=builder /home/app/target/micronautguide /app/application

EXPOSE 8080
ENTRYPOINT ["/app/application"]


