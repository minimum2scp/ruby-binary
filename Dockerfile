FROM debian:9.3
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    build-essential autoconf bison ca-certificates libgdbm-dev libncursesw5-dev libncurses5-dev \
    libreadline-dev zlib1g-dev libffi-dev libyaml-dev libgmp-dev libssl-dev \
    ruby
ADD https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.gz /tmp
RUN tar xf /tmp/ruby-2.5.0-rc1.tar.gz -C /tmp
WORKDIR /tmp/ruby-2.5.0-rc1
RUN ./configure --prefix=/usr/local/ruby-2.5.0-rc1 --disable-install-doc
RUN make -j 8
RUN make install

