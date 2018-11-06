QT += qml quick

CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    images/back.png \
    images/cinema.png \
    images/home.png \
    images/paper-plane.png \
    images/photo.png \
    images/tv-show.png
