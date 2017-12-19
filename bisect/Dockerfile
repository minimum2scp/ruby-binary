FROM minimum2scp/ruby:latest

RUN apt-get update
RUN apt-get install -y --no-install-recommends libssl-dev autoconf

COPY ruby /usr/src/ruby
WORKDIR /usr/src/ruby
RUN autoconf
RUN ./configure --prefix=/usr/local/ruby --disable-install-doc
RUN make -j 8
RUN make install

ENV PATH=/usr/local/ruby/bin:$PATH

RUN ruby -v
RUN gem env
#RUN gem list -d

