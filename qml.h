#ifndef QML_H
#define QML_H

#include <QMainWindow>

namespace Ui {
class QML;
}

class QML : public QMainWindow
{
    Q_OBJECT

public:
    explicit QML(QWidget *parent = nullptr);
    ~QML();

private:
    Ui::QML *ui;
};

#endif // QML_H
