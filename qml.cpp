#include "qml.h"
#include "ui_qml.h"

QML::QML(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::QML)
{
    ui->setupUi(this);
}

QML::~QML()
{
    delete ui;
}
