FROM  mcr.microsoft.com/dotnet/core/aspnet:2.2
LABEL maintainer="stevenbetancurt@hotmail.com"

WORKDIR /app

#RUN wget -O /tmp/aeps_webadmin.tar.gz https://github.com/apache/incubator-superset/archive/${WEBADMIN_VERSION}.tar.gz && \
#    tar xzf /tmp/aeps_webadmin.tar.gz -C ${WEBADMIN_HOME} --strip-components=1
RUN apt-get update && \
    apt-get install -y \
        vim

COPY site/ ./

VOLUME [ "/app" ]

EXPOSE 80
#EXPOSE 443

ENTRYPOINT ["dotnet", "CIAT.DAPA.AEPS.WebAdministrative.dll"]