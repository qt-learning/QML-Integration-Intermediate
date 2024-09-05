#include "globals.h"

Globals::Globals(QObject *parent)
    : QObject{parent}
{
    qInfo() << this << "created";
}

Globals *Globals::create(QQmlEngine *qmlEngine, QJSEngine *jsEngine) //no default constructor for singleton available so create() is called
{
    qInfo() << "create function called";
    static Globals *instance = new Globals();
    return instance;
}

void Globals::generateNumber()
{
    m_num = QRandomGenerator::global()->bounded(1, 10);
    emit numChanged();
}
