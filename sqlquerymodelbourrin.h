#ifndef SQLQUERYMODELBOURRIN_H
#define SQLQUERYMODELBOURRIN_H

#include <QSqlQueryModel>
#include <QSqlTableModel>
#include "DbConnection.hpp"

class CompanyModel : public QSqlTableModel {
    Q_OBJECT

public:
    enum Roles {
        IdRole = Qt::UserRole + 1,
        NameRole,
        AgeRole,
        SalaryRole
    };


    CompanyModel(const QSqlDatabase& db, QObject *parent = nullptr) : QSqlTableModel(parent, db) {
        if (database().isValid()) {
            QStringList tables = database().tables();
            qDebug() << "Tables in the database:";
            qDebug() << tables;
            for (const QString &table : tables) {
                this->setTable(table);
                qDebug() << "Table " << this->tableName() << "set" ;
                if (!this->select()) {
                    qDebug() << "Failed to select data:" << this->lastError().text();
                }
                else {
                    qDebug() << "The query has returned " << rowCount() << "elements";
                    // Print the data to verify the query results
                    for (int row = 0; row < rowCount(); ++row) {
                        int id = data(index(row, 0), IdRole).toInt();
                        QString name = data(index(row, 1), NameRole).toString();
                        int age = data(index(row, 2), AgeRole).toInt();
                        double salary = data(index(row, 3), SalaryRole).toDouble();

                        qDebug() << "ID:" << id << ", Name:" << name << ", Age:" << age << ", Salary:" << salary;
                    }

                }

            }


        }
    }

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override {
        if (role >= Qt::UserRole) {
            int column = role - (Qt::UserRole + 1);
            QModelIndex modelIndex = this->index(index.row(), column);
            return QSqlTableModel::data(modelIndex, Qt::DisplayRole);
        }
        return QSqlTableModel::data(index, role);
    }

    QHash<int, QByteArray> roleNames() const override {
        QHash<int, QByteArray> roles;
        roles[IdRole] = "ID";
        roles[NameRole] = "NAME";
        roles[AgeRole] = "AGE";
        roles[SalaryRole] = "SALARY";
        return roles;
    }

    QStringList listTables() {
        QStringList tables;
        if (database().isOpen()) {
            tables = database().tables();
            qDebug() << "Tables in the database:";
            for (const QString &table : tables) {
                qDebug() << table;
            }
        } else {
            qDebug() << "Database is not open.";
        }
        return tables;
    }
};

#endif // SQLQUERYMODELBOURRIN_H
