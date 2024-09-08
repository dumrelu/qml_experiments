#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QDirIterator>

#include <QtPlugin>
Q_IMPORT_PLUGIN(MyPlugin)


int main(int argc, char *argv[])
{
    qputenv("QT_QUICK_CONTROLS_STYLE", QByteArray("Material"));
    qputenv("QT_QUICK_CONTROLS_MATERIAL_THEME", QByteArray("Dark"));

    QGuiApplication app(argc, argv);

    QDirIterator it(":", QDirIterator::Subdirectories);
    while (it.hasNext()) {
        qDebug() << it.next();
    }

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/ExperimentQtQuickTesting/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.addImportPath("qrc:/");
    engine.load(url);

    return app.exec();
}
