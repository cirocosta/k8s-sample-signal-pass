images: image-with-signal-defined image-without-signal-defined

image-%:
	docker build \
		-t cirocosta/sample-signals:$* \
		--target final-$* \
		.
