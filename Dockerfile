FROM alpine:latest

RUN apk add --no-cache neovim git sqlite

RUN adduser --disabled-password --gecos "" nvim
RUN mkdir /src && chown nvim:users /src 

USER nvim
WORKDIR /src

ARG ppath=/home/nvim/.local/share/nvim/site/pack

RUN git clone https://github.com/nvim-lua/plenary.nvim ${ppath}/plenary.nvim/start/plenary.nvim
RUN git clone https://github.com/nvim-telescope/telescope.nvim.git ${ppath}/telescope.nvim/start/telescope.nvim
RUN git clone https://github.com/MunifTanjim/nui.nvim.git ${ppath}/nui.nvim/start/nui.nvim
RUN git clone https://github.com/folke/noice.nvim.git ${ppath}/noice.nvim/start/noice.nvim
RUN git clone https://github.com/nvim-lualine/lualine.nvim ${ppath}/lualine.nvim/start/lualine.nvim
RUN git clone https://github.com/folke/tokyonight.nvim.git ${ppath}/tokyonight.nvim/start/tokyonight.nvim
RUN git clone https://github.com/kkharji/sqlite.lua ${ppath}/sqlite.lua/start/sqlite.lua
RUN git clone https://github.com/ecthelionvi/NeoComposer.nvim ${ppath}/NeoComposer.nvim/start/NeoComposer.nvim

COPY config/ /home/nvim/.config/nvim/

CMD ["/usr/bin/nvim"]
