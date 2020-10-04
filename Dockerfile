FROM alpine:latest AS builder

RUN apk add --no-cache unzip

ADD https://media.forgecdn.net/files/2354/152/Terra+Swoop+Force+-+By+Noxcrew+(V1.5.2)+(Unzip+This).zip /tsf.zip
WORKDIR /build
RUN unzip /tsf.zip

FROM amazoncorretto:8-alpine-jre
COPY --from=builder /build /srv
COPY --from=voltairemc/spigot-server:1.16.3 /spigot.jar /srv/spigot.jar