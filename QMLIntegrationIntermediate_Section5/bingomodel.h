#ifndef BINGOMODEL_H
#define BINGOMODEL_H

#include <QAbstractListModel>
#include <QQmlEngine>
#include <QRandomGenerator>

struct ListElement
{
    ListElement(int num, bool found)
    {
        m_num = num;
        m_found = found;
    };
    int m_num;
    bool m_found;
};

class BingoModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT
    QML_UNCREATABLE("bingomodel not intended to be created");

public:
    explicit BingoModel(QObject *parent = nullptr);
    enum BingoRoles { NumRole = 1, FoundRole };
    void addListElement();

    // Basic functionality:
    Q_INVOKABLE int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    Qt::ItemFlags flags(const QModelIndex &index) const override;
    QHash<int, QByteArray> roleNames() const override;
    Q_INVOKABLE void setListElem(int listIndex, QVariantMap elem);
    Q_INVOKABLE void resetModel();

private:
    QList<ListElement> m_data;
    int m_count;
};

#endif // BINGOMODEL_H
