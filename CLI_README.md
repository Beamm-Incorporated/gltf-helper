# `gltf-helper`

glb/gltf(web images) -> glb(basis images)

A CLI to convert gltf/glb assets with png/jpg textures into glb
assets with embedded basis/ktx2 textures.

Made with typer -> [check it](https://github.com/tiangolo/typer)

**Usage**:

```console
$ gltf-helper [OPTIONS] COMMAND [ARGS]...
```

**Options**:

* `--install-completion`: Install completion for the current shell.
* `--show-completion`: Show completion for the current shell, to copy it or customize the installation.
* `--help`: Show this message and exit.

**Commands**:

* `convert`: Convert a glb/gltf(web images) -> glb(basis...
* `expand-glb`: Expand a glb

## `gltf-helper convert`

Convert a glb/gltf(web images) -> glb(basis images)

**Usage**:

```console
$ gltf-helper convert [OPTIONS] INPUT
```

**Options**:

* `--tag TAG`: [default: basisu]
* `--keep-temp-gltf`
* `-v, --verbose`
* `-bf, --basisu-flag TEXT`
* `-gf, --gltf-pipeline-flag TEXT`
* `--help`: Show this message and exit.

## `gltf-helper expand-glb`

Expand a glb

**Usage**:

```console
$ gltf-helper expand-glb [OPTIONS] FILE
```

**Options**:

* `-gf, --gltf-pipeline-flag TEXT`
* `-v, --verbose`
* `--help`: Show this message and exit.
