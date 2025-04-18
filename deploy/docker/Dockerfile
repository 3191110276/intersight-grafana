FROM grafana/grafana:latest

USER root

RUN grafana-cli plugins install yesoreyeram-infinity-datasource

RUN grafana-cli plugins install marcusolsson-dynamictext-panel

RUN apk update && apk add git

RUN wget https://github.com/grafana/grizzly/releases/latest/download/grr-linux-amd64

RUN mv ./grr-linux-amd64 /usr/local/bin/grr

RUN chmod +x /usr/local/bin/grr

RUN git clone https://github.com/3191110276/intersight-grafana.git

COPY startup.sh startup.sh

RUN chmod +x startup.sh

USER grafana

EXPOSE 3000

ENTRYPOINT ["./startup.sh"]