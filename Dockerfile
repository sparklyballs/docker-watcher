FROM lsiobase/alpine.python
MAINTAINER chbmb

# set python to use utf-8 rather than ascii.
ENV PYTHONIOENCODING="UTF-8"

# install build packages
RUN \
 apk add --no-cache --virtual=build-dependencies \
	g++ \
	gcc \
	python-dev && \

# install pip packages
 pip install --no-cache-dir -U \
	python-Levenshtein && \

# cleanup
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root/.cache

# add local files
COPY root/ /

# ports and volumes
EXPOSE 9090
WORKDIR /app/watcher
VOLUME /config /downloads /movies
