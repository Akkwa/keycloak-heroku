FROM jboss/keycloak:13.0.1

COPY docker-entrypoint.sh /opt/jboss/tools
COPY akkwa /opt/jboss/keycloak/themes

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]

