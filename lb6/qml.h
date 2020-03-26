#ifndef QML_H
#define QML_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class Qml; }
QT_END_NAMESPACE

class Qml : public QMainWindow
{
    Q_OBJECT

public:
    Qml(QWidget *parent = nullptr);
    ~Qml();

private:
    Ui::Qml *ui;
};
#endif // QML_H
