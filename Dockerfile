LABEL maintainer="Tibor Hudik <tibor@barrage.net>"

FROM node:12

# download wkhtmltox package
ADD https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb /opt

# install libraries for wkhtmltox
RUN apt-get update && apt-get install -y -q --no-install-recommends \
    xfonts-75dpi \
    xfonts-base \
    && rm -rf /var/lib/apt/lists/*

# install wkhtmltox
RUN dpkg --install /opt/*.deb

# remove packages after install
RUN rm -rf /opt/*.deb
