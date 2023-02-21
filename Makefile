ide:
	podman build --tag=fuckadey/ide:latest \
		--build-arg=USER=anonymous \
		--file=Containerfile .
