FROM alpine:edge

RUN set -ex && \
	apk add --no-cache --update \
		bash \
		bzip2-dev \
		ca-certificates \
		coreutils \
		curl \
		dpkg \
		dpkg-dev \
		expat-dev \
		findutils \
		gcc \
		g++ \
		git \
		gnupg \
		jq \
		libc-dev \
		libffi-dev \
		libjpeg \
		libjpeg-turbo-dev \
		libwebp-dev \
		libpq \
                libressl-dev \
		libxml2 \
		libxml2-dev \
		libxslt-dev \
		linux-headers \
		make \
		musl \
		neofetch \
		openssl \
	        python3 \
                python3-dev \
                readline-dev \
                pv \
                sqlite \
		sqlite-dev \
		sudo \
		tar \
		util-linux-dev \
		wget \
		xz \
		xz-dev \
		zip \
		zlib-dev		
RUN python3 -m ensurepip \
    && pip3 install --upgrade pip setuptools \
    && pip3 install wheel \
    && rm -r /usr/lib/python*/ensurepip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

#Fizilion

RUN sed -e 's;^#http\(.*\)/edge/community;http\1/edge/community;g' -i /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

RUN set -ex && \
	apk add --no-cache --update \
		aria2 \
		chromium \
		chromium-chromedriver \
                ffmpeg \
		figlet \
		freetype-dev \
		libevent \
		megatools \
		nodejs \
                npm \
                openssh \
                p7zip \
		postgresql \
		patchelf \
		postgresql-dev \
		postgresql-client

ADD https://raw.githubusercontent.com/FrosT2k5/ProjectFizilion/dragon/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN rm -rf requirements.txt



CMD ["python3"]
