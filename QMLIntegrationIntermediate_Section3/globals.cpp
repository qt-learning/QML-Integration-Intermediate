#include "globals.h"

Globals::Globals(QObject *parent)
    : QObject{parent}
{
    qInfo() << this << "created";
}

void Globals::generateNumber()
{
    m_num = QRandomGenerator::global()->bounded(1, 10);
    emit numChanged();
}
