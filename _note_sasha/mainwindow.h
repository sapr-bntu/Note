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

public:
    Ui::MainWindow *ui;
    QSqlDatabase db;
    QDate dat;
    QString str;
    QSqlQuery query_1;
public slots:
    bool ToDate(QString strD);
    bool Add();
    bool Delete(QString idT);
    bool Update(QString idT);
    bool CreateDB(bool flag);
    bool LoadData(QDate date);
    bool OpenDB();
};

#endif // MAINWINDOW_H
