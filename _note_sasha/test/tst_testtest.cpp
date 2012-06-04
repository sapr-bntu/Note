#include <QtGui>
#include <QtCore/QString>
#include <QtTest/QtTest>
#include <QtCore/QCoreApplication>
#include "../mainwindow.h"

class TestTest : public QObject
{
    Q_OBJECT
    
public:
    TestTest();
    
private Q_SLOTS:
    void initTestCase();
    void cleanupTestCase();
    void testCase1();
    void testCase4();
    void testCase5();
    void testCase6();
    void testCase7();
    void testCase8();
    void testCase9();
};

TestTest::TestTest()
{
}

void TestTest::initTestCase()
{
}

void TestTest::cleanupTestCase()
{
}

void TestTest::testCase1()
{
    MainWindow mw;
    QCOMPARE(mw.CreateDB(true),true);
}

void TestTest::testCase4()
{
    MainWindow mw;
    QCOMPARE(mw.OpenDB(),true);
}

void TestTest::testCase5()
{
    QCalendarWidget* cal=new QCalendarWidget;
    QDate dat=cal->selectedDate();
    MainWindow mw;
    QCOMPARE(mw.LoadData(dat),true);
}

void TestTest::testCase6()
{
    MainWindow mw;
    QCOMPARE(mw.Add(),true);
}

void TestTest::testCase7()
{
    MainWindow mw;
    QCOMPARE(mw.Delete("11"),true);
}

void TestTest::testCase8()
{
    MainWindow mw;
    QCOMPARE(mw.Update("11"),true);
}
void TestTest::testCase9()
{
    MainWindow mw;
    QCOMPARE(mw.ToDate("04.06.2012"),true);
}

QTEST_MAIN(TestTest)

#include "tst_testtest.moc"
