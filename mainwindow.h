#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSqlDatabase>
#include <QDate>
#include <QSqlQuery>

namespace Ui {
    class MainWindow;
}

class MainWindow : public QMainWindow {
    Q_OBJECT
public:
    MainWindow(QWidget *parent = 0);
    ~MainWindow();

protected:
    void changeEvent(QEvent *e);

private:
    Ui::MainWindow *ui;
    QSqlDatabase db;
    QDate dat;
    QString str;
    QSqlQuery query_1;
private slots:
    void ToDate();
    void Add();
    void Delete();
    void Update();
};

#endif // MAINWINDOW_H
