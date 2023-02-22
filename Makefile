ide:
	podman build --tag=fuckadey/ide:latest \
		--build-arg=NICK=anonymous \
		--file=Containerfile .
