#include <Account.hpp>
#include <iostream>

int main()
{
    Account a(100);
    std::cout << "Account balance: " << a.GetBalance() << std::endl;
    std::cout << "Set balance to 50" << std::endl;
    a.SetBalance(50);
    std::cout << "Account balance: " << a.GetBalance() << std::endl;
    return 0;
}