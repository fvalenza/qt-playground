#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ListModel.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    ListModel listModel;
    engine.rootContext()->setContextProperty("listModel", &listModel);

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
