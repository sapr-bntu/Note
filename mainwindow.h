#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtSql>
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
    Ui::MainWindow *ui;
    QSystemTrayIcon *trIcon;
    QSqlDatabase db;
    QDate dat;
    QString str;
    QSqlQuery query_1;
    QSqlTableModel *model;


private slots:
    void showHide(QSystemTrayIcon::ActivationReason);
    void ToDate();
    void Add();
    void Delete();
    void Update();
};

#endif // MAINWINDOW_H
