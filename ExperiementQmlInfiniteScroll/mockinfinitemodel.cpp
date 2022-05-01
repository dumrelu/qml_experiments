#include "mockinfinitemodel.h"

#include <QDebug>

MockInfiniteModel::MockInfiniteModel(QObject *parent)
    : QAbstractListModel{parent}
{
    m_timer.setInterval(std::chrono::seconds{ 3 });
    m_timer.setSingleShot(true);
    connect(&m_timer, &QTimer::timeout, [this]()
        {
            qDebug() << "Inserting 10 more elements";
            beginInsertRows({}, m_numberOfItems, m_numberOfItems + 9);
            m_numberOfItems += 10;
            endInsertRows();

            setFetchInProgress(false);
        }
    );
}

void MockInfiniteModel::fetchMoreItems()
{
    qDebug() << "Fetching more items...";
    if(!m_timer.isActive())
    {
        m_timer.start();
        setFetchInProgress(true);
    }
}

bool MockInfiniteModel::fetchInProgress() const
{
    return m_fetchInProgress;
}

void MockInfiniteModel::setFetchInProgress(bool fetchInProgress)
{
    if(fetchInProgress != m_fetchInProgress)
    {
        m_fetchInProgress = fetchInProgress;
        emit fetchInProgressChanged();
    }
}

QHash<int, QByteArray> MockInfiniteModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Roles::IndexRole] = "indexRole";

    return roles;
}

int MockInfiniteModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_numberOfItems;
}

QVariant MockInfiniteModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid() && index.row() < 0 || index.row() >= m_numberOfItems)
    {
        return {};
    }

    QVariant value;
    if(role == IndexRole)
    {
        value = index.row();
    }

    return value;
}
