#ifndef LISTMODEL_H
#define LISTMODEL_H

#include "qqmlintegration.h"
#include <QObject>
#include <QStringList>
#include <QAbstractListModel>

class ListModel : public QAbstractListModel {
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QStringList items READ items WRITE setItems NOTIFY itemsChanged)

public:
    explicit ListModel(QObject *parent = nullptr) : QAbstractListModel(parent) {
        m_items = {"Objet 1", "Objet 2", "Objet 3", "Objet 4", "Objet 5"};
    }

    QStringList items() const {
        return m_items;
    }

    void setItems(const QStringList &items) {
        if (m_items != items) {
            m_items = items;
            emit itemsChanged();
        }
    }

    int rowCount(const QModelIndex &parent = QModelIndex()) const override {
        Q_UNUSED(parent);
        return m_items.count();
    }

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override {
        if (!index.isValid() || index.row() >= m_items.size() || role != Qt::DisplayRole)
            return QVariant();
        return m_items.at(index.row());
    }

signals:
    void itemsChanged();

private:
    QStringList m_items;
};

#endif // LISTMODEL_H
