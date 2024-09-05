#ifndef COUNTERS_H
#define COUNTERS_H

#include <QObject>
#include <QQmlEngine>

class Counters : public QObject
{
    Q_OBJECT
    QML_ANONYMOUS
    Q_PROPERTY(int turnsRemaining MEMBER m_turnsRemaining NOTIFY turnsRemainingChanged FINAL)
    Q_PROPERTY(int matchCounter MEMBER m_matchCounter NOTIFY matchCounterChanged FINAL)

public:
    explicit Counters(QObject *parent = nullptr);

signals:
    void turnsRemainingChanged();
    void matchCounterChanged();

private:
    int m_turnsRemaining;
    int m_matchCounter;
};

#endif // COUNTERS_H
