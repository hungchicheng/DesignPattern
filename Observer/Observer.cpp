#include <iostream>
#include <set>
using namespace std;

class Observer{
public:
    virtual void update(int p) = 0;
};

class Subject{
protected:
    std::set< Observer* > m_observerList;
public:
    void attach( Observer *o ){ m_observerList.insert( o ); };
    void detach( Observer *o ){ m_observerList.erase( o ); };
    virtual void notify () = 0;
};

class  Subject1:public Subject{
private:
    int m_state;
public:
    void notify (){
        for ( auto &o : m_observerList ){
            o->update(m_state);
        }
    };
    void setState( int s ){
        m_state = s;
        notify();
    }
    int getState(){ return m_state; }
};

class Observer1:public Observer{
    string m_name;
    int m_state;
public:
    Observer1( string name ):m_name( name ){}
    void update( int p ){ m_state = p; } // override
    string getName(){ return m_name; }
    int getState(){ return m_state; }
};

class Observer2:public Observer{
    string m_name;
    int m_state;
public:
    Observer2( string name ):m_name( name ){}
    void update( int p ){ m_state = p; } // override
    string getName(){ return m_name; } 
    int getState(){ return m_state; }
};

int main(int argc, char* argv[])
{
    Subject1 product;
    Observer1 shop1( "shop1--" );
    Observer2 shop2( "shop2--" );
    
    product.attach( &shop1 );
    product.attach( &shop2 );
    product.setState( 12 );
    cout<< shop1.getName() << shop1.getState() <<endl;
    cout<< shop2.getName() << shop2.getState() <<endl;
    
    product.detach( &shop2 );
    product.setState( 11 );
    cout<< shop1.getName() << shop1.getState() <<endl;
    cout<< shop2.getName() << shop2.getState() <<endl;
    
    return 0;
}