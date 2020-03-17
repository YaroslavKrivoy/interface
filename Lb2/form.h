#ifndef FORM_H
#define FORM_H

#include <QMainWindow>

namespace Ui {
class Form;
}

class Form : public QMainWindow
{
    Q_OBJECT

public:
    explicit Form(QWidget *parent = nullptr);
    ~Form();

private slots:
    void on_actionOpen_triggered();

    void on_actionSave_triggered();

    void on_actionSave_as_triggered();

    void on_actionOpen_wuth_default_arguments_triggered();

    void on_actionPrint_triggered();

private:
    Ui::Form *ui;
    QString fileName = "";
};

#endif // FORM_H
