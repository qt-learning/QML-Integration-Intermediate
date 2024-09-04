#include "counters.h"

Counters::Counters(QObject *parent)
    : QObject{parent}
    , m_turnsRemaining(10)
    , m_matchCounter(0)
{}
