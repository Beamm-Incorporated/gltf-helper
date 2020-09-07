FROM ubuntu:focal as builder

WORKDIR /

ENV TZ=Africa/Cairo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    cmake \
    libzstd-dev \  
    ninja-build \
    doxygen \
    libsdl2-dev \ 
    libgl1-mesa-glx \ 
    libgl1-mesa-dev \
    libvulkan1 \
    libvulkan-dev \ 
    libassimp-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/KhronosGroup/KTX-Software.git

RUN cd KTX-Software \
    && cmake . -B build \
    && cmake --build build \
    && cd build \
    && make install

FROM ubuntu:focal

RUN apt-get update \
    && apt-get install -y \
    python3.8 \
    python3-pip \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash \
    && apt-get update \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*
    
RUN npm install -g gltf-pipeline 

COPY --from=builder /usr/local /usr/local/

RUN cp /usr/local/lib/lib* /lib/

COPY gltf_helper /gltf_helper

RUN pip3 install --no-cache-dir gltf-helper \
    && rm -rf /root/.cache

ENTRYPOINT ["gltf-helper"]
