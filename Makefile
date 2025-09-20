build:
	docker build -t hcssmith/neovim-container .

run:
	docker run -it -v `pwd`:/src hcssmith/neovim-container
