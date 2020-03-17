#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtGui>



QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    void drawGraph(bool notEmpty = 0); // функция, отвечающая за отрисовку графика
    void recountPixels(); // в зависимости от точности (об этом позже) считаем количество пикселей на один условный сантиметр
    void getData(); // получаем значения границ графика и точности
    double f(double x); // первая функция
    double f1(double x); // вторая функция
    double f2(double x); // третья функция
    double f3(double x); // четвертая функция
    double calcFunction(double x);

private slots:
    void on_pushButton_clicked();

    void on_color_clicked();

    void on_actionPrint_triggered();

private:
    Ui::MainWindow *ui;
    double leftX,rightX; // границы по х
    double leftY,rightY; // границы по у
    int pictWidth,pictHeight; // ширина и высота картинки
    double step; // шаг (точность)
    double onePixelX,onePixelY; // количество пикселей на шаг
    double Ox,Oy; // координаты центра
    QColor color;
    Qt::PenStyle style;
    qreal width;
};
#endif // MAINWINDOW_H
