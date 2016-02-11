#include "mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent)
{
    setWindowFlags(Qt::FramelessWindowHint);
    setAttribute(Qt::WA_TranslucentBackground);
    setAttribute(Qt::WA_NoSystemBackground);
    ui = new QDeclarativeView;
       ui->setSource(QUrl("qrc:/Design.qml"));
       setCentralWidget(ui);
       ui->setResizeMode(QDeclarativeView::SizeRootObjectToView);

       //Находим корневой элемент
          Root = ui->rootObject();
          //Соединяем C++ и QML, делая видимым функции С++ через элемент window
          ui->rootContext()->setContextProperty("window", this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::FunctionC()
{
    //Найдем строку ввода
    QObject* textinput = Root->findChild<QObject*>("textinput");

    //Найдем поле вывода
    QObject* memo = Root->findChild<QObject*>("memo");

    QString str;//Создадим новую строковую переменную

    //Считаем информацию со строки ввода через свойство text
    str=(textinput->property("text")).toString();

    int a;
    a=str.toInt();//Переведем строку в число
    a++;//Добавим к числу 1

    QString str2;//Создадим еще одну строковую переменную
    str2=QString::number(a);//Переведем число в строку

    //Ну и наконец выведем в поле вывода нашу информацию
    memo->setProperty("text", str+"+1="+str2);
}
