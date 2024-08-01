#ifndef DBCONNECTION_HPP
#define DBCONNECTION_HPP

#include<QtSql>
#include<QSqlDatabase>
#include<QDebug>

class DbConnection{
private:
    QSqlDatabase db;
public:
    DbConnection(){
        // Connect to MySQL server without specifying a database initially
        QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
        this->db=db;
    }

    QSqlDatabase connectDB() {
        this->db.setHostName("localhost");
        this->db.setUserName("fvalenza");
        this->db.setPassword("");  // Set the correct password.
        // this->db.setPort(3306);
        this->db.setDatabaseName("testFVA");

        if(this->db.open()){
            qDebug()<<"connection was successful!";
            return this->db;
        }
        else {
            qDebug() << this->db.lastError();
        }
        return db={};
    }



};

#endif // DBCONNECTION_HPP
