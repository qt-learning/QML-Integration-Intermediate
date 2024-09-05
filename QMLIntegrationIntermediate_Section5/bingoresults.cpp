#include "bingoresults.h"

BingoResults::BingoResults()
{}

QString BingoResults::message()
{
    return m_message;
}

void BingoResults::setMessage(QString newMessage)
{
    m_message = newMessage;
}

void BingoResults::calculate(int matchCounter, int turnsRemaining, int listSize)
{
    if (matchCounter >= listSize)
    {
        m_message = "You win!";
    }
    else if (turnsRemaining <= 1)
    {
        m_message = "You lose";
    }
    else
    {
        m_message = "";
    }
}
