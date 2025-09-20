FROM alpine:latest

RUN apk add --no-cache neovim git openssh sqlite sqlite-libs sqlite-dev \
tree-sitter-grammars

RUN adduser --disabled-password --gecos "" nvim
RUN mkdir /src && chown nvim:users /src 

USER nvim
WORKDIR /src

ARG ppath=/home/nvim/.local/share/nvim/site/pack

RUN mkdir -p ${ppath}

ADD git@github.com:nvim-lua/plenary.nvim.git ${ppath}/plenary.nvim/start/plenary.nvim
ADD git@github.com:nvim-telescope/telescope.nvim.git ${ppath}/telescope.nvim/start/telescope.nvim
ADD git@github.com:MunifTanjim/nui.nvim.git ${ppath}/nui.nvim/start/nui.nvim
ADD git@github.com:folke/noice.nvim.git ${ppath}/noice.nvim/start/noice.nvim
ADD git@github.com:nvim-lualine/lualine.nvim.git ${ppath}/lualine.nvim/start/lualine.nvim
ADD git@github.com:folke/tokyonight.nvim.git ${ppath}/tokyonight.nvim/start/tokyonight.nvim
ADD git@github.com:kkharji/sqlite.lua.git ${ppath}/sqlite.lua/start/sqlite.lua
ADD git@github.com:ecthelionvi/NeoComposer.nvim.git ${ppath}/NeoComposer.nvim/start/NeoComposer.nvim
ADD git@github.com:NeogitOrg/neogit.git ${ppath}/neogit/start/neogit
ADD git@github.com:lewis6991/gitsigns.nvim.git ${ppath}/gitsigns.nvim/start/gitsigns.nvim
ADD git@github.com:ThePrimeagen/git-worktree.nvim.git ${ppath}/git-worktree.nvim/start/git-worktree.nvim
ADD git@github.com:nvim-treesitter/nvim-treesitter.git ${ppath}/nvim-treesitter/start/nvim-treesitter

COPY config/ /home/nvim/.config/nvim/

CMD ["/usr/bin/nvim"]
