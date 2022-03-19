FROM ansible/centos7-ansible
SHELL ["/bin/bash", "-c"]
RUN yum -y upgrade && yum -y update
RUN yum -y install gcc gcc-c++ openssl-devel readline-devel zlib-devel bzip2 make
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
# CMD /bin/bash ~/.nvm/nvm.sh
# CMD /bin/bash ~/.nvm/bash_completion
# ENV NVM_DIR /root/.nvm
# RUN nvm -v
    # [ -s "~/.nvm/nvm.sh" ] && . "~/.nvm/nvm.sh" && \
    # [ -s "~/.nvm/bash_completion" ] && . "~/.nvm/bash_completion"

RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && \
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:$PATH
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN ~/.rbenv/bin/rbenv install 2.7.0 && ~/.rbenv/bin/rbenv global 2.7.0 && \
    gem install multi_json -v '1.10.1' && \
    ~/.rbenv/bin/rbenv exec gem install bundler && \
    ~/.rbenv/bin/rbenv rehash && \
    gem install rails
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash && \
    source ~/.bash_profile && \
    nvm install v14.16.1 && \
    nvm alias default v14.16.1 && \
    npm install --global yarn
RUN cd && mkdir rep

