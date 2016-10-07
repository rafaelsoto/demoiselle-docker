FROM jboss/wildfly

MAINTAINER SUPSS <supss@serpro.gov.br>

ADD demoiselle-docker.war /opt/wildfly/standalone/deployments/
