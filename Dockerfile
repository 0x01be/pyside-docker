FROM alpine

RUN apk add --no-cache --virtual pyside-build-dependencies \
    git \
    build-base \
    cmake \
    python3-dev \
    py3-wheel \
    llvm-dev \
    clang-dev \
    libxml2-dev \
    libxslt-dev

RUN apk add --no-cache --virtual pyside-edge-build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    qt5-qtbase-dev \
    qt5-qttools-dev \
    qt5-qttools-static \
    qt5-qtscript-dev \
    qt5-qtxmlpatterns-dev \
    qt5-qtmultimedia-dev \
    qt5-qtconnectivity-dev \
    qt5-qtx11extras-dev \
    qt5-qtlocation-dev \
    qt5-qtdeclarative-dev \
    qt5-qtquickcontrols2-dev \
    qt5-qtremoteobjects-dev \
    qt5-qtscxml-dev \
    qt5-qt3d-dev \
    qt5-qtquick3d-dev \
    qt5-qtdatavis3d-dev \
    qt5-qtsensors-dev \
    qt5-qtserialport-dev \
    qt5-qtserialbus-dev \
    qt5-qtspeech-dev \
    qt5-qtcharts-dev \
    qt5-qtsvg-dev \
    qt5-qtwebengine-dev \
    qt5-qtwebsockets-dev \
    qt5-qtwebchannel-dev \
    qt5-qtlottie-dev \
    qt5-qtquicktimeline \
    qt5-qtwayland-dev \
    qt5-qtvirtualkeyboard-dev \
    samurai \
    py3-qt5 \
    py3-shiboken2

ENV PYSIDE_REVISION 5.15.1
RUN git clone --depth 1 --branch ${PYSIDE_REVISION} https://code.qt.io/pyside/pyside-setup /pyside
RUN git clone --depth 1 --branch v${PYSIDE_REVISION}  https://code.qt.io/pyside/pyside-tools /pyside/sources/pyside2-tools

WORKDIR /pyside/build
RUN cmake \
   -DCMAKE_INSTALL_PREFIX=/opt/pyside \
   ..
RUN make
RUN make install

