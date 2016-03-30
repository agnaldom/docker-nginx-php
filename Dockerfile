FROM  nginx:1.9
MAINTAINER  Agnaldo Marinho <agnaldoneto@ufpa.br>


# Update Base Image
# Install Software Requirements
RUN apt-get update && \
    apt-get install -y php5-cli php5-curl php5-fpm php5-gd php5-mcrypt php5-mysql
RUN apt-get autoremove -y && apt-get autoremove -y && apt-get autoclean && \
						  echo -n > /var/lib/apt/extended_states && \
						  rm -rf /var/lib/apt/lists/* &&\
						  rm -rf /usr/share/man/?? &&\
						  rm -rf /usr/share/man/??_*

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/
COPY wordpress /usr/share/nginx/html/
