FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install -y locales -qq \
  && locale-gen en_US.UTF-8 en_us \
  && dpkg-reconfigure locales \
  && locale-gen C.UTF-8 \
  && /usr/sbin/update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
  && apt-get install -y --no-install-recommends shellcheck \
  && rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

CMD ["entrypoint.sh"]
