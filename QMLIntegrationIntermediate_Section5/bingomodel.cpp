#include "bingomodel.h"

BingoModel::BingoModel(QObject *parent)
    : QAbstractListModel(parent)
{}

void BingoModel::addListElement()
{
    m_data << ListElement(QRandomGenerator::global()->bounded(1,10), 0);
}

int BingoModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;
    return m_data.size();
}

QVariant BingoModel::data(const QModelIndex &index, int role) const
{
    if (!checkIndex(index, CheckIndexOption::IndexIsValid))
        return QVariant();

    if (!index.isValid())
        return QVariant();

    int row = index.row();
    const ListElement result = m_data[row];
    switch (role) {
    case NumRole:
        return result.m_num;

    case FoundRole:
        return result.m_found;
    }
    return QVariant();
}

QHash<int, QByteArray> BingoModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[FoundRole] = "found";
    roles[NumRole] = "number";
    return roles;
}

bool BingoModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (role != Qt::EditRole || value.toString().isEmpty())
        return false;
    emit dataChanged(index, index);
    return true;
}

Qt::ItemFlags BingoModel::flags(const QModelIndex &index) const
{
    return QAbstractListModel::flags(index) | Qt::ItemIsEditable;
}


void BingoModel::setListElem(int listIndex, QVariantMap elem)
{
    ListElement listElem(elem.value("number").toInt(), elem.value("found").toBool()); //create new listElement based on argument values
    m_data[listIndex] = listElem; //update bingoModel with new values
    QModelIndex index = createIndex(listIndex, 0);
    emit dataChanged(index, index);
}

void BingoModel::resetModel()
{
    int originalListSize = m_data.size();
    m_data.remove(0, originalListSize);
    for (int i = 0; i < originalListSize; i++) //update elements in bingoModel
    {
        m_data << ListElement(QRandomGenerator::global()->bounded(1,10), 0);
        QModelIndex index = createIndex(i, 0);
        emit dataChanged(index, index);
    }
}
