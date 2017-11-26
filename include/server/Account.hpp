#pragma once

class Account
{

public:

    Account();
    Account(const int bal);
    int GetBalance() const;
    int SetBalance(const int bal);
  
private:
    
    int balance;
    
};