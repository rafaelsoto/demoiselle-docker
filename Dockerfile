FROM java:openjdk-8-alpine

MAINTAINER SUPSS <supss@serpro.gov.br>

ENV JBOSS_FOLDER=jboss-eap-6.4
ENV JBOSS_FILE=${JBOSS_FOLDER}.0.zip
#ENV JBOSS_URL=http://nexus.aic.serpro/service/local/repositories/componentes-corporativos/content/tiamat/jboss-eap/6.4.0/jboss-eap-6.4.0.zip
ENV JBOSS_URL=/opt/jboss-eap-6.4.0.zip

ENV JBOSS_BASE_FOLDER=JBOSS-BASE

EXPOSE 8080

#ADD $JBOSS_URL /tmp
COPY $JBOSS_URL /tmp

COPY $JBOSS_BASE_FOLDER /tmp/$JBOSS_BASE_FOLDER

RUN unzip /tmp/$JBOSS_FILE -d /tmp && \
	mv /tmp/$JBOSS_FOLDER /jboss-eap && \
	rm /tmp/$JBOSS_FILE && \
	cp -r /tmp/$JBOSS_BASE_FOLDER/* /jboss-eap && \
	rm -rf /tmp/$JBOSS_BASE_FOLDER

CMD ["/jboss-eap/bin/standalone.sh", "-b", "0.0.0.0"]

COPY demoiselle-docker.war /tmp/$JBOSS_BASE_FOLDER/standalone/deployment