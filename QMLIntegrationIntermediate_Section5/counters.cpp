# Copyright (C) 2026 Qt Group.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include "counters.h"

Counters::Counters(QObject *parent)
    : QObject{parent}
    , m_turnsRemaining(10)
    , m_matchCounter(0)
{}
