FROM rikorose/gcc-cmake AS builder

WORKDIR /

RUN git clone https://github.com/BinomialLLC/basis_universal.git

RUN cd basis_universal \
    && cmake CMakeLists.txt \
    && make

FROM ubuntu:focal

RUN apt-get update \
    && apt-get install -y \
    python3.8 \
    python3-pip \
    curl

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash \
    && apt-get install -y nodejs
    
RUN npm install -g gltf-pipeline 

COPY --from=builder /basis_universal/bin/basisu /usr/bin

COPY gltf_helper /gltf_helper

RUN pip3 install --no-cache-dir poetry \
    && rm -rf /root/.cache

COPY pyproject.toml /pyproject.toml

RUN poetry config http-basic.mypypi hekfe furfir

ENTRYPOINT ["python3", "/lib/main.py"]
