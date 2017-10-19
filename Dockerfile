FROM ubuntu:latest
ENV TZ 'Europe/Oslo'
RUN echo $TZ > /etc/timezone
RUN apt -qq update  && apt -qq --force-yes -y --no-install-recommends install perl  make build-essential tzdata ca-certificates cpanminus git && rm -rf /var/lib/apt/lists/*
RUN  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&  dpkg-reconfigure -f noninteractive tzdata
ADD . /opan
RUN cpanm -qn https://github.com/Reisegiganten/App-opan.git@recurring_pull
VOLUME ["/data"]
WORKDIR /data
ENTRYPOINT /opan/run_opan.sh
