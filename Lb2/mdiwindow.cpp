#include "mdiwindow.h"
#include "ui_mdiwindow.h"
#include "mainwindow.h"
#include "form.h"
#include <QMdiSubWindow>

MdiWindow::MdiWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MdiWindow)
{
    ui->setupUi(this);
    setCentralWidget(ui->mdiArea);
}

MdiWindow::~MdiWindow()
{
    delete ui;
}

void MdiWindow::on_actionGrafikForm_triggered()
{
    loadSubWindow(new MainWindow(this));
}

void MdiWindow::loadSubWindow(QWidget *widget)
{
    auto window = ui->mdiArea->addSubWindow(widget);
    window->setWindowTitle(widget->windowTitle());
    window->setWindowIcon(widget->windowIcon());

    window->show();
}

void MdiWindow::on_actionFileForm_triggered()
{
    loadSubWindow(new Form(this));
}
