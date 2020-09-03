# GLTF Helper

```glb(web images) -> glb(basis images)```

Allows converting gltf/glb files with embedded jpgs/pngs to glb files with embedded basisu images.

## `Features`

- [x] glb (web images) -> glb (basisu images)
- [ ] glb (web images) -> glb (ktx2 images)
- [ ] glb (basisu images) -> glb (web images)
- [ ] glb (ktx2 images) -> glb (web images)
- [x] multiple files
- [x] custom basisu compression flags

## `Use cases`

Unity gltf pipeline:
- [GLTFUtility](https://github.com/Siccity/GLTFUtility) 
- [KTXUnity](https://github.com/atteneder/KtxUnity)

See [sample project](https://github.com/daverin/glTF-universal-tex-unity-demo) ✨

## `Blue Pill Usage`

#### Test
```
make docker-test
```

#### Help 

```
make docker-help
```
makefile ->  [check it](https://github.com/Beamm-Incorporated/gltf-helper/blob/master/makefile)

## `Red Pill Usage`

 1) build basisu -> [check it](https://github.com/BinomialLLC/basis_universal#command-line-compression-tool)

 2) install gltf-pipeline -> [check it](https://github.com/CesiumGS/gltf-pipeline#getting-started)

 ```
 pip install --user gltf-helper
 ```

#### Test
```
make cli-test
```

#### Help 

```
make cli-help
```
CLI readme ->  [check it](CLI_README.md)