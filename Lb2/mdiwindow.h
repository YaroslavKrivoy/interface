#ifndef MDIWINDOW_H
#define MDIWINDOW_H


#include <QMainWindow>


namespace Ui {
class MdiWindow;
}

class MdiWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MdiWindow(QWidget *parent = nullptr);
    ~MdiWindow();

private slots:
    void on_actionGrafikForm_triggered();

    void on_actionFileForm_triggered();

private:
    Ui::MdiWindow *ui;

    void loadSubWindow(QWidget *widget);
};

#endif // MDIWINDOW_H
