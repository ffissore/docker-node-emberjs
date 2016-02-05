FROM node:4.2.6

RUN npm install -g ember-cli@1.13.15
RUN npm install -g bower@1.7.7
RUN npm install -g phantomjs@1.9.19

# install watchman
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.5.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install

