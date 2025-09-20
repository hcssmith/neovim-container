build:
	docker build -t hcssmith/neovim-container --ssh default .

run:
	docker run -it -v `pwd`:/src hcssmith/neovim-container

nock:
	docker run -it -v /home/hsmith/RiderProjects/Nock2:/src --network bridge hcssmith/neovim-container
