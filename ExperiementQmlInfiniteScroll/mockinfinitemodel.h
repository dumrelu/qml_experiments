#ifndef MOCKINFINITEMODEL_H
#define MOCKINFINITEMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QTimer>

class MockInfiniteModel : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(bool fetchInProgress READ fetchInProgress WRITE setFetchInProgress NOTIFY fetchInProgressChanged)
public:
    enum Roles {
        IndexRole = Qt::UserRole + 1
    };

    explicit MockInfiniteModel(QObject *parent = nullptr);

    Q_INVOKABLE void fetchMoreItems();

    bool fetchInProgress() const;
    void setFetchInProgress(bool fetchInProgress);

    // QAbstractListModel
    QHash<int, QByteArray> roleNames() const override;
    int rowCount(const QModelIndex& parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;

signals:
    void fetchInProgressChanged();

private:
    int m_numberOfItems = 10;
    QTimer m_timer;
    bool m_fetchInProgress = false;
};

#endif // MOCKINFINITEMODEL_H
