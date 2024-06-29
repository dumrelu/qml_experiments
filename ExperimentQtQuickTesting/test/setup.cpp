#include "setup.h"

void Setup::applicationAvailable()
{
    // custom code that doesn't require QQmlEngine
}

void Setup::qmlEngineAvailable(QQmlEngine *engine)
{
    // add import paths
    engine->addImportPath("qrc:/");
}

void Setup::cleanupTestCase()
{
    // custom code to clean up before destruction starts
}
