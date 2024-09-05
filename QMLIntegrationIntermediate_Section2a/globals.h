#ifndef GLOBALS_H
#define GLOBALS_H

#include <QObject>
#include <QQmlEngine>
#include <QRandomGenerator>

class Globals : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    Q_PROPERTY(int num MEMBER m_num NOTIFY numChanged FINAL)

public:
    Globals(QObject *parent = nullptr);
    Q_INVOKABLE void generateNumber();

signals:
    void numChanged();

private:
    int m_num = 0;
};

#endif // GLOBALS_H
