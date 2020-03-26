#include "qml.h"
#include "ui_qml.h"

Qml::Qml(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::Qml)
{
    ui->setupUi(this);
}

Qml::~Qml()
{
    delete ui;
}

