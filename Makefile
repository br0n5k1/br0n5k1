nickname = anonymous

ide:
	podman build --tag=fuckadey/ide:latest \
		--build-arg=NICK=$(nickname) \
		--file=Containerfile .

release:
	make
	echo TODO Create image and upload to registry.

install:
	echo TODO Ensure host system is set up.

uninstall:
	echo TODO Remove IDE settings from the host system.
