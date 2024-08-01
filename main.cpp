#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ListModel.hpp"
#include "sqlquerymodelbourrin.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    ListModel listModel;
    engine.rootContext()->setContextProperty("listModel", &listModel);

    DbConnection dbConn;
    QSqlDatabase db = dbConn.connectDB();
    CompanyModel companyModel(db);
    engine.rootContext()->setContextProperty("companyModel", &companyModel);


    const QUrl url(QStringLiteral("qrc:/getting-started/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
