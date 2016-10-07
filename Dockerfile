FROM java:openjdk-8-alpine

MAINTAINER SUPSS <supss@serpro.gov.br>

#ENV JBOSS_URL=http://nexus.aic.serpro/service/local/repositories/componentes-corporativos/content/tiamat/jboss-eap/6.4.0/jboss-eap-6.4.0.zip
ENV JBOSS_INSTALL_PACKAGE=/opt/jboss-eap-6.4.0.zip

ENV JBOSS_BASE_FOLDER=/opt/jboss

EXPOSE 8080

#ADD $JBOSS_URL /tmp
COPY $JBOSS_INSTALL_PACKAGE /$JBOSS_BASE_FOLDER

#COPY $JBOSS_BASE_FOLDER /tmp/$JBOSS_BASE_FOLDER

RUN unzip $JBOSS_INSTALL_PACKAGE -d $JBOSS_BASE_FOLDER 

ENTRYPOINT ["$JBOSS_BASE_FOLDER/bin/standalone.sh", "-b", "0.0.0.0"]

COPY demoiselle-docker.war $JBOSS_BASE_FOLDER/standalone/deployment