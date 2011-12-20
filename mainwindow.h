#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSystemTrayIcon>
namespace Ui {
    class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    QSystemTrayIcon *trIcon;

    Ui::MainWindow *ui;
private slots:
    void showHide(QSystemTrayIcon::ActivationReason);
};

#endif // MAINWINDOW_H
