#include "form.h"
#include "ui_form.h"
#include <QtGui>
#include <QFileDialog>
#include <QMessageBox>
#include <QPrintDialog>
#include <QPrinter>

Form::Form(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Form)
{
    ui->setupUi(this);
}

Form::~Form()
{
    delete ui;
}

void Form::on_actionOpen_triggered()
{
    fileName = QFileDialog::getOpenFileName(this,
                                QString::fromUtf8("Открыть файл"),
                                "C://",
                                "Text File (*.txt);;All files (*.*)");
    QFile file(fileName);
    if(file.open(QIODevice::ReadOnly))
    {
        ui->textEdit->setText(file.readAll());
    }
    else{
        ui->textEdit->setText("Error");
    }
    file.close();

}

void Form::on_actionSave_triggered()
{
    if (fileName == "") {
        fileName = QFileDialog::getSaveFileName(
                            this,
                            tr("Save Document"),
                            "C://",
                            tr("Text File (*.txt)") );
    }
    QFile file(fileName);
    if (!file.open(QIODevice::WriteOnly)) {
        QMessageBox::critical(this,"Error","File not opened");
    } else {
        QTextStream stream(&file);
        stream << ui->textEdit->toPlainText();
        stream.flush();
        file.close();
    }
}

void Form::on_actionSave_as_triggered()
{
    QString fileNameSaveAs = QFileDialog::getSaveFileName(
                        this,
                        tr("Save Document"),
                        "C://",
                        tr("Text File (*.txt)") );
    if (fileNameSaveAs != "") {
            QFile file(fileNameSaveAs);
            if (!file.open(QIODevice::WriteOnly)) {
                QMessageBox::critical(this,"Error","File not opened");
            } else {
                QTextStream stream(&file);
                stream << ui->textEdit->toPlainText();
                stream.flush();
                file.close();
            }
     }
}

void Form::on_actionOpen_wuth_default_arguments_triggered()
{
    fileName = QFileDialog::getOpenFileName(this,
                                QString::fromUtf8("Открыть файл"),
                                "C://",
                                "Text File (*.txt);;All files (*.*)",
                                nullptr,
                                QFileDialog::DontConfirmOverwrite);
    QFile file(fileName);
    if(file.open(QIODevice::ReadOnly))
    {
        ui->textEdit->setText(file.readAll());
    }
    else{
        ui->textEdit->setText("Error");
    }
    file.close();
}

void Form::on_actionPrint_triggered()
{
    QPrinter printer;
    QPrintDialog printDialog(&printer, this);
    if (printDialog.exec() == QDialog::Accepted) {
        printer.setOutputFileName(QDir::currentPath() + "test.pdf");
        ui->textEdit->print(&printer);
    }
}
