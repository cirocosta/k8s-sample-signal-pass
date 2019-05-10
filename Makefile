images: image-with-signal-defined image-without-signal-defined

push: push-with-signal-defined push-without-signal-defined


setup:
	kubectl apply -f ./explicit.yaml
	kubectl apply -f ./implicit.yaml


cleanup:
	kubectl delete pod explicit
	kubectl delete pod implicit


image-%:
	docker build \
		-t cirocosta/sample-signal-pass:$* \
		--target final-$* \
		.

push-%:
	docker push cirocosta/sample-signal-pass:$*

