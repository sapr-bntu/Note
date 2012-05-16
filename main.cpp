#include <QtGui/QApplication>
#include "mainwindow.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QCoreApplication::addLibraryPath( "/data/data/org.kde.necessitas.ministro/files/qt/plugins/" );
    MainWindow w;
    w.show();
    return a.exec();
}

