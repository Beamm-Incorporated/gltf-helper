SHELL := /bin/bash # Use bash syntax

build:
	docker build . -t gltf-helper

test:
	docker run -t \
		-v $$(pwd)/samples:/samples \
		gltf-helper convert \
			/samples/Avocado/avo.gltf/asset.gltf \
			/samples/Avocado/avo_binary.glb \
		-bf "-y_flip" \
		--tag basisutest
	
test-dev:
	docker run -t \
		-v $$(pwd)/samples:/samples \
		-v $$(pwd)/lib/main.py:/lib/main.py \
		gltf-helper convert \
			/samples/Avocado/avo.gltf/asset.gltf \
			/samples/Avocado/avo_binary.glb \
		-bf "-y_flip" \
		--tag basisutest \
		-v

help:
	docker run -t \
		-v $$(pwd)/samples:/samples \
		gltf-helper --help