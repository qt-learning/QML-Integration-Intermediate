#ifndef BINGORESULTS_H
#define BINGORESULTS_H

#include <QObject>
#include <QQmlEngine>
#include "counters.h"

class BingoResults : public Counters
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged FINAL)

public:
    BingoResults();
    QString message();
    void setMessage(QString newMessage);
    Q_INVOKABLE void calculate(int matchCounter, int turnsRemaining, int listSize);

signals:
    void messageChanged();

private:
    QString m_message;
};

#endif // BINGORESULTS_H
