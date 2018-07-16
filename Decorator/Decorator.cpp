#include <iostream>
using namespace std;

class I {
public:
    virtual ~I(){}
    virtual void show() = 0;
};

class Hero: public I {
public:
    Hero(string n):name(n){}
    ~Hero() {
        cout << name << " dtor" << '\n';
    }
    /*virtual*/
    void show() {
        cout << name << " with ";
    }
private:
    string name;
};

class Equiment: public I {
public:
    Equiment(I *inner) {
        m_wrappee = inner;
    }
    ~Equiment() {
        delete m_wrappee;
    }
    /*virtual*/
    void show() {
        m_wrappee->show();
    }
private:
    I *m_wrappee;
};

class Helmet: public Equiment {
public:
    Helmet(I *core): Equiment(core){}
    ~Helmet() {
        cout << "Helmet dtor, ";
    }
    /*virtual*/
    void show() {
        Equiment::show();
        cout << "Helmet, ";
    }
};

class Armour: public Equiment {
public:
    Armour(I *core): Equiment(core){}
    ~Armour() {
        cout << "Armour dtor, ";
    }
    /*virtual*/
    void show() {
        Equiment::show();
        cout << "Armour, ";
    }
};

class Boots: public Equiment {
public:
    Boots(I *core): Equiment(core){}
    ~Boots() {
        cout << "Boots dtor, ";
    }
    /*virtual*/
    void show() {
        Equiment::show();
        cout << "Boots, ";
    }
};

int main() {
    I *hero1H = new Helmet(new Hero("Hero1"));
    I *hero2HA = new Armour(new Helmet(new Hero("Hero2")));
    I *hero3HAB = new Boots(new Armour(new Helmet(new Hero("Hero3"))));
    I *hero4BH = new Helmet(new Boots(new Hero("Hero4"))); //Hero 4 with no Armour
    hero1H->show();
    cout << '\n';
    hero2HA->show();
    cout << '\n';
    hero3HAB->show();
    cout << '\n';
    hero4BH->show();
    cout << '\n';
    delete hero1H;
    delete hero2HA;
    delete hero3HAB;
    delete hero4BH;
}

