#include <iostream>
using namespace std;

class AttackStrategy{
public:
    virtual void attack() = 0;
};

class SwordAttackStrategy: public AttackStrategy{
public:
    virtual void attack(){ cout << "use sword to attack" << endl; }  // override
};

class ArcheryAttackStrategy: public AttackStrategy{
public:
    virtual void attack(){ cout << "use bow to attack" << endl; }  // override
};

class HeroBase{
private:
    AttackStrategy *m_strategy;
    string m_name;
public:
    HeroBase( string name, AttackStrategy *strategy ):m_name( name ),m_strategy( strategy ){}
    void set_strategy( AttackStrategy *strategy ){ m_strategy = strategy; }
    void attack(){
        cout << m_name << endl;
        m_strategy -> attack();
    }
};

int main( int argc, char *argv[] )
{
    // warrior
    SwordAttackStrategy swordAttackStrategy;
    HeroBase warrior( "warrior1", &swordAttackStrategy );
    warrior.attack();
    // archer
    ArcheryAttackStrategy archeryAttackStrategy;
    HeroBase archer( "archer1", &archeryAttackStrategy );
    archer.attack();
    return 0;
}
