#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "cmath"
#include "QMessageBox"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_result_button_clicked()
{
    double result = 0.0;
    double x = ui->value->text().toDouble();
    if(ui->sin->isChecked()){
        result = sin(x);
    }else if(ui->cos->isChecked()){
        result = cos(x);
    }else if(ui->log->isChecked()){
        result = log(x);
    }else if(ui->tan->isChecked()){
        result = tan(x);
    }
    QString res = QString::number(result,'g',2);
    ui->result_text->setText(res);
    QMessageBox::about(this,"Result",res);
}
