#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "QMessageBox"
#include "QTableWidgetItem"
#include "QColorDialog"
#include "cmath"
#include <QDebug>
#include <QPrintDialog>
#include <QPrinter>


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QStringList lst;
    lst << "x" << "y";
    ui->tableWidget->setHorizontalHeaderLabels(lst);
    pictHeight = 370; // задаем высоту картинки
    pictWidth = 480; // и её ширину
    step = 0.1; // задаем начальный шаг
    leftX = -100; rightX = 100; // и начальные значения границ
    leftY = -1; rightY = 1;
    color = Qt::blue;
    width = 1.0;
    style = Qt::SolidLine;
    drawGraph(); // сразу же отрисовываем пустой график
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    double startInterval = ui->startInterval->value();
    double finishInterval = ui->finishInterval->value();
    double countPoints = ui->countPoints->value();
    int count = 0;
    ui->tableWidget->clear();
    ui->tableWidget->setRowCount(0);
    if(startInterval >= finishInterval){
        QMessageBox::critical(this,"Ошибка ввода","Начальное значение не должно превышать конечное значение интервала");
    }
    else{
        double step = (finishInterval - startInterval)/countPoints;
        for(double i = startInterval; i < finishInterval; i+=step){
            ui->tableWidget->insertRow(count);
            ui->tableWidget->setItem(count, 0, new QTableWidgetItem(QString("%1").arg(i)));
            ui->tableWidget->setItem(count, 1, new QTableWidgetItem(QString("%1").arg(calcFunction(i))));
            count++;
        }
    }
    getData();
    recountPixels();
    drawGraph(1);
}

double MainWindow::calcFunction(double x){
    double result = 0.0;
    if(ui->sin->isChecked()){
        result = sin(x);
    }else if(ui->cos->isChecked()){
        result = cos(x);
    }else if(ui->log->isChecked()){
        result = log(x);
    }else if(ui->tan->isChecked()){
        result = tan(x);
    }
    return result;
}

double MainWindow::f(double x)
{
    return sin(x)*(-1);
}

double MainWindow::f1(double x)
{
    return cos(x)*(-1);
}

double MainWindow::f2(double x)
{
    return log(x)*(-1);
}

double MainWindow::f3(double x)
{
    return tan(x)*(-1);
}

// метод вычисляет середину экрана и пересчитывает количество пикселей на шаг
void MainWindow::recountPixels()
{
    onePixelX = 540.0/(rightX-leftX);
    onePixelY = 370.0/(rightY-leftY);
    Ox = fabs(leftX); Oy = rightY;
}

void MainWindow::getData()
{
    leftX = ui->startInterval->value(); // узнаем границы
    rightX = ui->finishInterval->value();
    step = 1.0/ui->countPoints->value(); // и шаг
    width = ui->widthLine->value();
    if(ui->solidLine->isChecked()){
        style = Qt::SolidLine;
    }else if(ui->dotLine->isChecked()){
        style = Qt::DotLine;
    }else if(ui->dashLine->isChecked()){
        style = Qt::DashLine;
    }
}

void MainWindow::drawGraph(bool notEmpty)
{
    QPixmap graph(540,370); // создаем саму картинку
    QPainter paint; // и пэинтер
    paint.begin(&graph); // запускаем отрисовку
    paint.eraseRect(0,0,540,370); // очищаем рисунок
    paint.drawLine(Ox*onePixelX,0,Ox*onePixelX,pictHeight); // и рисуем координатные оси
    paint.drawLine(0,Oy*onePixelY,pictWidth,Oy*onePixelY);

    paint.setPen(QPen(Qt::black,3)); // устанавливаем цвет и толщину "пера"
    for(double i = leftX;i<=rightX;i+=10.0) // рисуем черточки на координатой оси
        paint.drawPoint((i+Ox)*onePixelX,Oy*onePixelY);
    for(double i = leftY;i<=rightY;i+=10.0)
        paint.drawPoint(Ox*onePixelX,(i+Oy)*onePixelY);

    // если мы не рисуем график, то отображаем координатную ось и выключаемся
    if(!notEmpty) {
        paint.end();
        ui->outputGraph->setPixmap(graph);
        return;
    }

    paint.setPen(QPen(Qt::green,1,Qt::SolidLine)); // снова задаем цвет и тип линии
    paint.setRenderHint(QPainter::Antialiasing, true); // задаем параметры рендеринга
    QPainterPath path,p[3]; // QPainterPath означаем, что мы вначале занесем все необходимые точки, а затем соединим их
    bool first[4] = {1,1,1,1}; // узнаем первая ли точка, или надо сдвигаться

    // последовательно проходимся по всем точкам графика, проверяем, существует ли функция в данной точке, и если существует -- заносим точку в массив отрисовки

    for(double i = (double)leftX+step;i<=(double)rightX;i+=step) {
        if(!std::isnan(f(i))) {
            if(first[0]) {
                path.moveTo((i+Ox)*onePixelX,(f(i)+Oy)*onePixelY);
                first[0] = false;
            }
            else
                path.lineTo((i+Ox)*onePixelX,(f(i)+Oy)*onePixelY);
        }
        if(!std::isnan(f1(i))) {
            if(first[1]) {
                p[0].moveTo((i+Ox)*onePixelX,(f1(i)+Oy)*onePixelY);
                first[1] = false;
            }
            else
                p[0].lineTo((i+Ox)*onePixelX,(f1(i)+Oy)*onePixelY);
        }
        if(!std::isnan(f2(i))) {
            if(first[2]) {
                p[1].moveTo((i+Ox)*onePixelX,(f2(i)+Oy)*onePixelY);
                first[2] = false;
            }
            else
                p[1].lineTo((i+Ox)*onePixelX,(f2(i)+Oy)*onePixelY);
        }
        if(!std::isnan(f3(i))) {
            if(first[3]) {
                p[2].moveTo((i+Ox)*onePixelX,(f3(i)+Oy)*onePixelY);
                first[3] = false;
            }
            else
                p[2].lineTo((i+Ox)*onePixelX,(f3(i)+Oy)*onePixelY);
        }
    }

    if(ui->sin->isChecked()) {
        paint.setPen(QPen(color,width,style));
        paint.drawPath(path);
    }
    if(ui->cos->isChecked()) {
        paint.setPen(QPen(color,width,style));
        paint.drawPath(p[0]);
    }
    if(ui->log->isChecked()) {
        paint.setPen(QPen(color,width,style));
        paint.drawPath(p[1]);
    }
    if(ui->tan->isChecked()) {
        paint.setPen(QPen(color,width,style));
        paint.drawPath(p[2]);
    }
    paint.end(); // заканчиваем рисование
    ui->outputGraph->setPixmap(graph); // и помещаем рисунок на форму
    return;
}

void MainWindow::on_color_clicked()
{
    color = QColorDialog::getColor();
}

void MainWindow::on_actionPrint_triggered()
{
    QString strStream;
       QTextStream out(&strStream);

       const int rowCount = ui->tableWidget->model()->rowCount();
       const int columnCount = ui->tableWidget->model()->columnCount();

       out <<  "<html>\n"
           "<head>\n"
           "<meta Content=\"Text/html; charset=Windows-1251\">\n"
           <<  QString("<title>%1</title>\n").arg("Print")
           <<  "</head>\n"
           "<body bgcolor=#ffffff link=#5000A0>\n"
           "<table border=1 cellspacing=0 cellpadding=2>\n";

       // headers
       out << "<thead><tr bgcolor=#f0f0f0>";
       for (int column = 0; column < columnCount; column++)
           if (!ui->tableWidget->isColumnHidden(column))
               out << QString("<th>%1</th>").arg(ui->tableWidget->model()->headerData(column, Qt::Horizontal).toString());
       out << "</tr></thead>\n";

       // data table
       for (int row = 0; row < rowCount; row++) {
           out << "<tr>";
           for (int column = 0; column < columnCount; column++) {
               if (!ui->tableWidget->isColumnHidden(column)) {
                   QString data = ui->tableWidget->model()->data(ui->tableWidget->model()->index(row, column)).toString().simplified();
                   out << QString("<td bkcolor=0>%1</td>").arg((!data.isEmpty()) ? data : QString("&nbsp;"));
               }
           }
           out << "</tr>\n";
       }
       out <<  "</table>\n"
           "</body>\n"
           "</html>\n";

       QTextDocument *document = new QTextDocument();
       document->setHtml(strStream);


    QPrinter printer;
    QPrintDialog printDialog(&printer, this);
    if (printDialog.exec() == QDialog::Accepted) {
        printer.setOutputFileName(QDir::currentPath() + "test.pdf");
        document->print(&printer);
    }
     delete document;
}
