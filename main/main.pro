include(../variables.pri)

TEMPLATE = app
LANGUAGE = C++
TARGET   = qlcplus

INCLUDEPATH  += ../ui/src ../ui/src/virtualconsole
INCLUDEPATH  += ../engine/src
INCLUDEPATH  += ../webaccess/src

QMAKE_LIBDIR += ../ui/src
QMAKE_LIBDIR += ../engine/src
QMAKE_LIBDIR += ../webaccess/src
LIBS         += -lqlcplusengine
LIBS         += -lqlcplusui
LIBS         += -lqlcpluswebaccess

win32:HEADERS += ../ui/src/debugbox.h
macx:HEADERS += ../ui/src/debugbox.h

SOURCES      += main.cpp
win32:SOURCES += ../ui/src/debugbox.cpp
macx:SOURCES += ../ui/src/debugbox.cpp

lessThan(QT_MAJOR_VERSION, 5) {
    win32:RC_FILE = main.rc
} else {
    win32:RC_ICONS += ../resources/icons/qlcplus.ico
    win32:QMAKE_TARGET_DESCRIPTION = "Q Light Controller+ Application"
    win32:QMAKE_TARGET_PRODUCT = "Q Light Controller+"
}

win32:FORMS += ../ui/src/debugbox.ui
macx:FORMS += ../ui/src/debugbox.ui

QT += gui core script
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

macx {
    # This must be after "TARGET = " and before target installation so that
    # install_name_tool can be run before target installation
    include(../macx/nametool.pri)
}

# Installation
target.path = $$INSTALLROOT/$$BINDIR
INSTALLS   += target
