#include "mdiwindow.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    a.setStyle("fasion");
    MdiWindow w;
    w.show();
    return a.exec();
}
