FROM gcr.io/google-appengine/openjdk

COPY target/*SNAPSHOT.jar app.jar

ENTRYPOINT ["java",\
            "-agentpath:/opt/cdbg/cdbg_java_agent.so", \
            "-Dcom.google.cdbg.module=hello-java", \
            "-Dcom.google.cdbg.version=0.0.1", \
            "-jar","/app.jar"]
