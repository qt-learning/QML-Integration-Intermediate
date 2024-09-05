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
    Q_PROPERTY(GeneratorStatus status MEMBER m_status NOTIFY statusChanged FINAL)

public:
    Globals(QObject *parent = nullptr);
    Q_INVOKABLE void generateNumber();

    //example using Q_ENUM
    enum GeneratorStatus { Ready = 0, Loading };
    Q_ENUM(GeneratorStatus)

signals:
    void numChanged();
    void statusChanged();

private:
    int m_num = 0;
    GeneratorStatus m_status = Ready;
};

#endif // GLOBALS_H
