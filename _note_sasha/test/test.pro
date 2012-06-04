#-------------------------------------------------
#
# Project created by QtCreator 2012-06-03T21:24:10
#
#-------------------------------------------------

QT       += testlib sql

TARGET = tst_testtest
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += tst_testtest.cpp \
../mainwindow.cpp
DEFINES += SRCDIR=\\\"$$PWD/\\\"
HEADERS += ../mainwindow.h \
../ui_mainwindow.h
