#include <iostream>
using namespace std;

class Singleton
{
private:
    // Here will be the instance stored.
    static Singleton* m_instance;
    
    // Private constructor to prevent instancing.
    Singleton();
    
public:
    // Static access method.
    static Singleton* getInstance();
};

// Start with 0 to create a new object
Singleton* Singleton::m_instance = 0;

Singleton* Singleton::getInstance()
{
    if (m_instance == 0)
    {
        // if it's multi-thread symstem, use synchronized to prevent
        cout << "new Singleton" << endl;
        m_instance = new Singleton();
    }
    else
        cout << "already exist" << endl;
    
    return m_instance;
}

Singleton::Singleton()
{}

int main()
{
    //new Singleton(); // Don't work
    Singleton* s = Singleton::getInstance(); // Ok
    cout << s << endl;
    Singleton* r = Singleton::getInstance();
    // The Addresses will be the same.
    cout << r << endl;
    
}

