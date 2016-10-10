FROM openjdk:alpine

MAINTAINER SUPSS <supss@serpro.gov.br>

ADD jboss-eap-6.4.zip /jboss-eap-6.4.zip
RUN unzip /jboss-eap-6.4.zip


#RUN wget http://nexus.aic.serpro/service/local/repositories/componentes-corporativos/content/tiamat/jboss-eap/6.4.0/jboss-eap-6.4.0.zip && \
#    unzip /jboss-eap-6.4.0.zip \
#    rm /jboss-eap-6.4.0.zip

EXPOSE 8080
ENTRYPOINT ["/jboss-eap-6.4/bin/standalone.sh", "-b", "0.0.0.0"]

ADD demoiselle-docker.war /jboss-eap-6.4/standalone/deployments
