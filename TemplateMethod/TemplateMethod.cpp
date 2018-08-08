#include <iostream>
using namespace std;

class HeroBase
{
public: 
    void showHeroInfo() { // template method
        cout << "Name: " << endl;
        _getHeroName();
        cout << "HP: " << endl;
        _getHeroHP();
        cout << "Number of skills: " << endl;
        _getNumberOfSkills();
    };

private:
    virtual void _getHeroName() = 0; // placeholders
    virtual void _getHeroHP() = 0; // placeholders
    void _getNumberOfSkills(){
        cout << 8 << endl;
    }
};

class Warrior: public HeroBase
{
private:
    void _getHeroName(){cout << "Olberic" << endl;}; // implement placeholder methods
    void _getHeroHP(){cout << "8000" << endl;};
};

class Cleric: public HeroBase
{
private:
    void _getHeroName(){cout << "Ophilia" << endl;}; // implement placeholder methods
    void _getHeroHP(){cout << "4000" << endl;};
};

int main()
{
    Warrior warrior;
    warrior.showHeroInfo();

    cout << endl;

    Cleric cleric;
    cleric.showHeroInfo();
}