FROM docker.io/mcandre/docker-debian:lenny
RUN set -ex; \
    echo 'APT::Get::AllowUnauthenticated "true";' > /etc/apt/apt.conf.d/99unauthenticated; \
    apt-get update && apt-get upgrade -y; \
    apt-get install -y \
      build-essential \
      checkinstall \
      curl \
      ldap-utils \
      less \
      libopenssl-ruby \
      libruby \
      libsqlite3-ruby \
      rake \
      rdoc \
      ri \
      ruby \
      ruby1.8-dev \
      sqlite3 \
      ttf-dejavu \
      vim \
      wget \
      zlib1g-dev \
      ; \
      apt-get autoclean;
WORKDIR /var/tmp
RUN curl http://rubygems.org/rubygems/rubygems-1.4.2.tgz -o rubygems-1.4.2.tgz; \
    tar -xf rubygems-1.4.2.tgz; \
    cd rubygems-1.4.2; \
    ruby setup.rb; \
    ln -s /usr/bin/gem1.8 /usr/bin/gem; \
    gem install bundler -v '1.0.10';
WORKDIR /
RUN mkdir -p /root/.vim/colors; \
    curl -k https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -o /root/.vim/colors/molokai.vim;
RUN { \
    echo 'syntax on'; \
        echo 'set noerrorbells'; \
        echo 'set tabstop=4 softtabstop=4'; \
        echo 'set shiftwidth=4'; \
        echo 'set expandtab'; \
        echo 'set smartindent'; \
        echo 'set number'; \
        echo 'set smartcase'; \
        echo 'set incsearch'; \
        echo 'set showmatch'; \
        echo 'set background=dark'; \
        echo 'set wildmode=longest,full'; \
        echo 'set wildmenu'; \
        echo 'set t_Co=256'; \
        echo 'highlight ColorColumn ctermbg=0 guibg=lightgrey'; \
        echo 'let g:molokai_original = 1'; \
        echo 'let g:rehash256 = 1'; \
        echo 'colorscheme molokai'; \
    } > /root/.vimrc;
RUN { \
    echo "alias ls='ls --color=auto'"; \
        echo "alias ll='ls -l'"; \
        echo "alias l='ls -lA'"; \
} >> /root/.bashrc
ENV PATH="/usr/lib/ruby/gems/1.8/bin/:${PATH}"
WORKDIR /usr/local/src
COPY ./ /usr/local/src
RUN bundle install
EXPOSE 3000
CMD ["/usr/local/src/script/server"]
