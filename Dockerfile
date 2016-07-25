FROM node:4

RUN npm install -g ember-cli
RUN npm install -g bower
RUN npm install -g phantomjs

# install watchman
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.5.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install

RUN rm -rf /root/.npm

EXPOSE 4200
WORKDIR /app

