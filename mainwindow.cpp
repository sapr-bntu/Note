#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    trIcon = new QSystemTrayIcon();
    trIcon->setIcon(QIcon(":/img/icon.png"));
    trIcon->show();

    connect(trIcon,SIGNAL(activated(QSystemTrayIcon::ActivationReason)),this,SLOT(showHide(QSystemTrayIcon::ActivationReason)));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::showHide(QSystemTrayIcon::ActivationReason r) {
    if (r==QSystemTrayIcon::Trigger)
    if (!this->isVisible()) {
       this->show();
    } else {
       this->hide();
    }
}
