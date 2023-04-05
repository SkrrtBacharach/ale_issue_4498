FROM registry.fedoraproject.org/fedora:37

ENV TESTHOME="/home/test"

RUN dnf install -y neovim git npm nodejs
RUN useradd test
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    /home/test/.local/share/nvim/site/pack/packer/start/packer.nvim
COPY nvim/lua/plugins.lua ${TESTHOME}/.config/nvim/lua/plugins.lua
COPY nvim/init.lua ${TESTHOME}/.config/nvim/init.lua
COPY nvim/init_bootstrap.lua ${TESTHOME}/.config/nvim/init_bootstrap.lua
COPY test.yml ${TESTHOME}/test.yml

RUN chown -R test:test /home/test

USER test
WORKDIR "${TESTHOME}"

RUN nvim -u ${TESTHOME}/.config/nvim/init_bootstrap.lua --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

#CMD ["/bin/bash", "-c", "while true; do sleep 84600; done"]
CMD ["/usr/bin/nvim", "/home/test/test.yml"]
