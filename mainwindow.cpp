#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QtSql>
#include <QtDebug>
#include <QtGui>
#include <QSqlDatabase>
#include <QSqlQueryModel>
#include <QSqlError>
#include <QTableView>
#include <QDebug>
#include <QSqlTableModel>
#include <QMessageBox>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    trIcon = new QSystemTrayIcon();
    trIcon->setIcon(QIcon(":/img/icon.png"));
    trIcon->show();



    if (!QFile::exists("Note.s3db") )
    {
        qDebug()<<"Фаил не существует";

        QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName("Note.s3db");
        if (!db.open())
        {
            QMessageBox::critical(0, qApp->tr("Cannot open database"),
                                  qApp->tr("Unable to establish a database connection.\n"
                                           "This example needs SQLite support. Please read "
                                           "the Qt SQL driver documentation for information how "
                                           "to build it.\n\n"
                                           "Click Cancel to exit."), QMessageBox::Cancel);
        }
        QSqlQuery query;
        query.exec("CREATE TABLE [note_table] ([id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,[note] TEXT  NULL,[date] VARCHAR(8)  NOT NULL)");
    }
    else
    {
        QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName("Note.s3db");
        if (!db.open())
        {
            QMessageBox::critical(0, qApp->tr("Cannot open database"),
                                  qApp->tr("Unable to establish a database connection.\n"
                                           "This example needs SQLite support. Please read "
                                           "the Qt SQL driver documentation for information how "
                                           "to build it.\n\n"
                                           "Click Cancel to exit."), QMessageBox::Cancel);
        }
    }

    QCalendarWidget* cal=new QCalendarWidget;
    dat=cal->selectedDate();
    model = new QSqlTableModel(this);
    model->setTable("note_table");
//    model->setFilter(string);
    model->select();
    ui->tableView_3->setModel(model);
//    connect(ui->pushButton_4,SIGNAL(clicked()),this,SLOT(ToDate()));
    connect(ui->pushButtonAdd,SIGNAL(clicked()),this,SLOT(Add()));
    connect(ui->pushButtonDelete,SIGNAL(clicked()),this,SLOT(Delete()));
    connect(ui->pushButtonEdit,SIGNAL(clicked()),this,SLOT(Update()));
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



void MainWindow::Add()
{
    dat = ui->calendarWidget->selectedDate();
//    ui->dateEdit->setDate(dat);
//    str=ui->dateEdit->text();
    str = dat.toString();
    QString str_1;
    str_1="INSERT INTO note_table (note,date) VALUES ('test','"+str+ "')"+"";
    QSqlQueryModel* query=new QSqlQueryModel;
    query->setQuery(str_1);
    QString string;
    string="date like '%"+str+"%'";
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    model->select();
    ui->tableView_3->setModel(model);
//    ui->tableView->show();
}

void MainWindow::Delete()
{

    dat = ui->calendarWidget->selectedDate();
//    ui->dateEdit->setDate(dat);
//    str=ui->dateEdit->text();
    str = dat.toString();
    QString str_1;

    str_1="DELETE FROM note_table Where date like '%"+str+"%'";
    QSqlQueryModel* query=new QSqlQueryModel;
    query->setQuery(str_1);
    QString string;
    string="date like '%"+str+"%'";
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    model->select();
    ui->tableView_3->setModel(model);
//    ui->tableView->show();
}

void MainWindow::Update()
{
    dat = ui->calendarWidget->selectedDate();
//    ui->dateEdit->setDate(dat);
//    str=ui->dateEdit->text();
    str = dat.toString();
    QString str_1;
    str_1="Update note_table set note='jhvbf' Where date like '%"+str+"%'";
    QSqlQueryModel* query=new QSqlQueryModel;
    query->setQuery(str_1);
    QString string;
    string="date like '%"+str+"%'";
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    model->select();
    ui->tableView_3->setModel(model);
//    ui->tableView->show();
}

void MainWindow::on_calendarWidget_clicked(const QDate &date)
{//бывший слот toDate
//    dat = ui->calendarWidget->selectedDate();
    QString string;
    string="date like '%"+date.toString()+"%'";
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    model->select();
    ui->tableView_3->setModel(model);
}
