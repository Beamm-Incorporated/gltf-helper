SHELL := /bin/bash 

# Docker

build:
	docker build . -t beamm/gltf-helper

docker-test:
	docker run -t \
		-v $$(pwd)/samples:/samples \
		beamm/gltf-helper convert \
			/samples/Avocado/avo.gltf/asset.gltf \
			/samples/Avocado/avo_binary.glb \
		-bf "-y_flip" \
		--tag basisutest

docker-help:
	docker run -t \
		-v $$(pwd)/samples:/samples \
		gltf-helper --help

docker-test-dev:
	docker run -t \
		-v $$(pwd)/samples:/samples \
		-v $$(pwd)/gltf_helper/main.py:/gltf_helper/main.py \
		--entrypoint "python3"\
		beamm/gltf-helper gltf_helper/main.py convert \
			/samples/Avocado/avo.gltf/asset.gltf \
			/samples/Avocado/avo_binary.glb \
		--tag basisutest \
		-vv

docker-test-convert-help:
	docker run -t \
		-v $$(pwd)/samples:/samples \
		-v $$(pwd)/gltf_helper/main.py:/gltf_helper/main.py \
		--entrypoint "python3"\
		beamm/gltf-helper gltf_helper/main.py convert\
			--help

# CLI

cli-test:
	gltf-helper convert \
		samples/Bug/asset.glb \
	-bf "-y_flip" \
	--tag basisutest

cli-help:
	gltf-helper --help

# Poetry

poetry-venv-install:
	poetry install

poetry-shell:
	poetry shell

poetry-build:
	poetry build

poetry-install:
	pip install --user $${WHEEL}

poetry-publish:
	poetry publish --build

poetry-docs:
	typer gltf_helper/main.py utils docs --output CLI_README.md --name gltf-helper