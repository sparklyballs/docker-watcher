FROM lsiobase/alpine.python
MAINTAINER chbmb

# set python to use utf-8 rather than ascii.
ENV PYTHONIOENCODING="UTF-8"

# add local files
COPY root/ /

# ports and volumes
EXPOSE 5050
WORKDIR /app/watcher
VOLUME /config /downloads /movies
