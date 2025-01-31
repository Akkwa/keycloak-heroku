FROM jboss/keycloak:latest

COPY ./docker-entrypoint.sh /opt/jboss/tools
COPY ./akkwa /opt/jboss/keycloak/themes/akkwa

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]

