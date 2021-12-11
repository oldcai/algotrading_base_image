FROM python:3.10.0b4

# original MAINTAINER Olivier TASSEL <https://github.com/otassel>
MAINTAINER oldcai <https://github.com/oldcai>

# TA-Lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  tar -xvzf ta-lib-0.4.0-src.tar.gz && \
  cd ta-lib/ && \
  ./configure --prefix=/usr && \
  make && \
  make install

RUN rm -R ta-lib ta-lib-0.4.0-src.tar.gz

WORKDIR /base_image/
ADD . /base_image/
RUN pip install -r requirements.txt
RUN rm -rf /base_image/
