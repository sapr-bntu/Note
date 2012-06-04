#include "mainwindow.h"
#include <../ui_mainwindow.h>
#include <QSqlTableModel>
#include <QSqlRelationalTableModel>
#include <QFile>
#include <QSqlRecord>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    if  (!QFile::exists("noteDB.s3db"))
    {
        CreateDB(true);
    }
    QCalendarWidget* cal=new QCalendarWidget;
    dat=cal->selectedDate();
    OpenDB();
    LoadData(dat);

    connect(ui->pushButton_4,SIGNAL(clicked()),this,SLOT(ToDate()));
    connect(ui->pushButton,SIGNAL(clicked()),this,SLOT(Add()));
    //connect(ui->pushButton_3,SIGNAL(clicked()),this,SLOT(Delete()));
    //connect(ui->pushButton_2,SIGNAL(clicked()),this,SLOT(Update()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

bool MainWindow::CreateDB(bool flag)
{
    if(flag)
    {
        OpenDB();
        QSqlQuery query;
        query.exec("CREATE TABLE [note_table] ([id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,[note] TEXT  NULL,[date] VARCHAR(8)  NOT NULL)");
        query.first();
        return true;
    }
    else
    {
        return false;
    }
}

bool MainWindow::OpenDB()
{
    ui->setupUi(this);
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("noteDB.s3db");
    db.open();
    if(db.open())
        return true;
    else
        return false;
}

bool MainWindow::LoadData(QDate date)
{
    ui->dateEdit->setDate(date);
    str=ui->dateEdit->text();
    QString string;
    string="date like '%"+str+"%'";
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    bool flag = model->select();
    ui->tableView->setModel(model);
    ui->tableView->show();
    if(flag)
        return true;
    else
        return false;
}

bool MainWindow::ToDate(QString strD)
{
    dat = ui->calendarWidget->selectedDate();
    ui->dateEdit->setDate(dat);
    str=ui->dateEdit->text();
    QString string;
    string="date like '%"+strD+"%'";
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    bool flag = model->select();
    ui->tableView->setModel(model);
    ui->tableView->show();
    if(flag)
        return true;
    else
        return false;
}

bool MainWindow::Add()
{
    dat = ui->calendarWidget->selectedDate();
    ui->dateEdit->setDate(dat);
    str=ui->dateEdit->text();

    QString str_1;
    QString note=ui->lineEdit->text();
    str_1="INSERT INTO note_table (note,date) VALUES ('"+note+"','"+str+ "')";
    QSqlQuery query;
    bool flag;
    if(query.exec(str_1))
        flag=true;
    else
        flag=false;
    QString string;
    string="date like '%"+str+"%'";
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    model->select();

    ui->tableView->setModel(model);
    ui->tableView->show();

    if(flag)
        return true;
    else
        return false;
}

bool MainWindow::Delete(QString idT)
{

    dat = ui->calendarWidget->selectedDate();
    ui->dateEdit->setDate(dat);
    str=ui->dateEdit->text();
    QString str_1;
    QString id=ui->lineEdit_2->text();
    str_1="DELETE FROM note_table Where date like '%"+str+"%' and id="+idT;
    QSqlQuery query;
    bool flag;
    if(query.exec(str_1))
        flag=true;
    else
        flag=false;
    QString string;
    string="date like '%"+str+"%'";
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    model->select();
    ui->tableView->setModel(model);
    ui->tableView->show();

    if(flag)
        return true;
    else
        return false;
}

bool MainWindow::Update(QString idT)
{
    dat = ui->calendarWidget->selectedDate();
    ui->dateEdit->setDate(dat);
    str=ui->dateEdit->text();
    QString str_1;
    QString id=ui->lineEdit_2->text();
    QString note=ui->lineEdit->text();
    str_1="Update note_table set note='"+note+"' Where date like '%"+str+"%' and id="+idT;
    QSqlQuery query;
    bool flag;
    if(query.exec(str_1))
        flag=true;
    else
        flag=false;
    QString string;
    string="date like '%"+str+"%'";
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    model->select();
    ui->tableView->setModel(model);
    ui->tableView->show();

    if(flag)
        return true;
    else
        return false;
}

void MainWindow::changeEvent(QEvent *e)
{
    QMainWindow::changeEvent(e);
    switch (e->type()) {
    case QEvent::LanguageChange:
        ui->retranslateUi(this);
        break;
    default:
        break;
    }
}
