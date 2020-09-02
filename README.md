## GLTF Helper

A docker image with:
- [basisu](https://github.com/BinomialLLC/basis_universal)
- [gltf-pipeline](https://github.com/CesiumGS/gltf-pipeline)
- gltf-helper `lib/main.py`

Allows converting gltf/glb files with embedded jpgs/pngs to glb files with embedded basisu images.

Makes use of [typer](https://github.com/tiangolo/typer) for python cli.

### Features
*System*
- [x] .glb (web images) -> .glb (basisu images)
- [ ] .glb (web images) -> .glb (ktx2 images)
- [ ] .glb (basisu images) -> .glb (web images)
- [ ] .glb (ktx2 images) -> .glb (web images)
- [x] multiple files
- [x] custom basisu compression flags

### Use cases

Built for production ready gltf pipeline in Unity:
- [GLTFUtility](https://github.com/Siccity/GLTFUtility) 
- [KTXUnity](https://github.com/atteneder/KtxUnity)

See [sample project](https://github.com/daverin/glTF-universal-tex-unity-demo) ✨

### Usage 

#### Test
```
docker run -t \
		-v $(pwd)/samples:/samples \
		gltf-helper convert \
			/samples/Avocado/avo.gltf/asset.gltf \
			/samples/Avocado/avo_binary.glb \
		-bf "-y_flip" \
		--tag basisutest
```

#### Help 

```
	docker run -t \
		-v $$(pwd)/samples:/samples \
		gltf-helper --help
```

TIP: Checkout `makefile` for other useful commands