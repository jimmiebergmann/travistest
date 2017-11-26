#include <Account.hpp>

Account::Account() :
    balance(0)
{}

Account::Account(const int bal) :
    balance(bal)
{ }

int Account::GetBalance() const
{
    return balance;
}

int Account::SetBalance(const int bal)
{
    balance = bal;
}