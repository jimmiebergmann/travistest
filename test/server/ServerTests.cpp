#include <Account.hpp>
#include <iostream>
//#include "gtest/gtest.h"

int main(int argc, char** argv)
{
    Account a(10);
    if(a.GetBalance() != 10)
    {
        std::cout << "Balance is not 10." << std::endl;
        return 1;
    }
    
    std::cout << "Test succeeded!" << std::endl;
    return 0;
    //::testing::InitGoogleTest(&argc, argv);
    //return RUN_ALL_TESTS();
}
