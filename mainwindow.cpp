#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QSqlTableModel>
#include <QSqlRelationalTableModel>
#include <QFile>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    if  (!QFile::exists("noteDB.s3db"))
    {
        db = QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName("noteDB.s3db");
        db.open();
      QSqlQuery query;
      query.exec("CREATE TABLE [note_table] ([id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,[note] TEXT  NULL,[date] VARCHAR(8)  NOT NULL)");
        query.first();



    }
//else
    {
    ui->setupUi(this);
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("noteDB.s3db");
    db.open();
    QCalendarWidget* cal=new QCalendarWidget;
    dat=cal->selectedDate();
    ui->dateEdit->setDate(dat);
    str=ui->dateEdit->text();
    //ui->label->setText(str);
    QString string;
    string="date like '%"+str+"%'";
//    ui->label_2->setText(string);
//    QSqlQueryModel* query=new QSqlQueryModel;
//    query->setQuery(string);
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    model->select();
    ui->tableView->setModel(model);
    ui->tableView->show();
}

    connect(ui->pushButton_4,SIGNAL(clicked()),this,SLOT(ToDate()));
    connect(ui->pushButton,SIGNAL(clicked()),this,SLOT(Add()));
    connect(ui->pushButton_3,SIGNAL(clicked()),this,SLOT(Delete()));
    connect(ui->pushButton_2,SIGNAL(clicked()),this,SLOT(Update()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::ToDate()
{
    dat = ui->calendarWidget->selectedDate();
    ui->dateEdit->setDate(dat);
    str=ui->dateEdit->text();
    //ui->label_2->setText(str);
    QString string;
    string="date like '%"+str+"%'";
    QSqlTableModel *model;
    model = new QSqlTableModel(this);
    model->setTable("note_table");
    model->setFilter(string);
    model->select();
    ui->tableView->setModel(model);
    ui->tableView->show();
}

void MainWindow::Add()
{
    dat = ui->calendarWidget->selectedDate();
    ui->dateEdit->setDate(dat);
    str=ui->dateEdit->text();
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
    ui->tableView->setModel(model);
    ui->tableView->show();
}

void MainWindow::Delete()
{

    dat = ui->calendarWidget->selectedDate();
    ui->dateEdit->setDate(dat);
    str=ui->dateEdit->text();
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
    ui->tableView->setModel(model);
    ui->tableView->show();
}

void MainWindow::Update()
{
    dat = ui->calendarWidget->selectedDate();
    ui->dateEdit->setDate(dat);
    str=ui->dateEdit->text();
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
    ui->tableView->setModel(model);
    ui->tableView->show();
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
