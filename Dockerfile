FROM voltairemc/spigot-server:1.11.2 AS builder

RUN apk add --no-cache unzip

ADD https://media.forgecdn.net/files/2354/152/Terra+Swoop+Force+-+By+Noxcrew+(V1.5.2)+(Unzip+This).zip /tsf.zip
WORKDIR /build
RUN unzip /tsf.zip

FROM amazoncorretto:8-alpine-jre
COPY --from=builder /build /srv
COPY --from=builder /spigot.jar /srv/spigot.jar
RUN echo 'eula=true' > /srv/eula.txt
WORKDIR /srv
ADD run /srv/run

CMD ["/srv/run"]