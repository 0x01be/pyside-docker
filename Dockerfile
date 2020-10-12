FROM alpine

RUN apk add --no-cache --virtual pyside-build-dependencies \
    git \
    build-base \
    python3-dev \
    qt5-qtbase-dev \
    cmake \
    py3-wheel \
    llvm-dev \
    clang-dev \
    qt5-qtxmlpatterns-dev \
    qt5-qtmultimedia-dev \
    qt5-qttools-dev \
    qt5-qtx11extras-dev \
    qt5-qtlocation-dev \
    qt5-qtdeclarative-dev \
    qt5-qtquickcontrols2-dev \
    qt5-qt3d-dev \
    libxml2-dev \
    libxslt-dev

RUN apk add --no-cache --virtual pyside-edge-build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    py3-shiboken2

ENV PYSIDE_REVISION 5.14.2
RUN git clone --depth 1 --branch ${PYSIDE_REVISION} https://code.qt.io/pyside/pyside-setup /pyside

WORKDIR /pyside
RUN python3 setup.py install --qmake=/usr/bin/qmake-qt5 --prefix=/opt/pyside

