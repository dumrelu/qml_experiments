#ifndef MYPLUGIN123_H
#define MYPLUGIN123_H

#include <QQmlEngineExtensionPlugin>
#include <QObject>
#include <QQmlEngine>
#include <QDebug>

#include <QtQml/qqmlextensionplugin.h>

extern void qml_register_types_my_module();
Q_GHS_KEEP_REFERENCE(qml_register_types_my_module);

class MyPlugin : public QQmlEngineExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)

public:
    MyPlugin(QObject *parent = nullptr) : QQmlEngineExtensionPlugin(parent)
    {
        volatile auto registration = &qml_register_types_my_module;
        Q_UNUSED(registration);
    }

    void initializeEngine(QQmlEngine *engine, const char *uri) override
    {
        qWarning() << "Initialize engine";
    }
};

#endif // MYPLUGIN_H
