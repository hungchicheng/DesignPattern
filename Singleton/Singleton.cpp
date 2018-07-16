#include <iostream>
using namespace std;

class Singleton
{
private:
    /* Here will be the instance stored. */
    static Singleton* m_instance;
    
    /* Private constructor to prevent instancing. */
    Singleton();
    
public:
    /* Static access method. */
    static Singleton* getInstance();
};

/* Null, because instance will be initialized on demand. */
Singleton* Singleton::m_instance = 0;

Singleton* Singleton::getInstance()
{
    if (m_instance == 0)
    {
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
    //new Singleton(); // Won't work
    Singleton* s = Singleton::getInstance(); // Ok
    cout << s << endl;
    Singleton* r = Singleton::getInstance();
    /* The addresses will be the same. */
    cout << r << endl;
    
}

