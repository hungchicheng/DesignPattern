#include <iostream>
#include <unordered_map>
#include <functional>
#include <vector>

// Base
class Monster {
public:
    virtual void appear() = 0;
};

// Factory
class MonsterFactory {
public:
    typedef std::unordered_map<std::string, std::function<Monster*()>> registry_map;
    
    // use this to instantiate the proper Derived class
    static Monster * instantiate(const std::string& name)
    {
        auto it = MonsterFactory::registry().find(name);
        return it == MonsterFactory::registry().end() ? nullptr : (it->second)();
    }
    
    static registry_map & registry(){
        static registry_map impl;
        return impl;
    }
    
};

template<typename T> struct MonsterFactoryRegister
{
    MonsterFactoryRegister(std::string name)
    {
        MonsterFactory::registry()[name] = []() { return new T; };
        std::cout << "Registering class '" << name << "'\n";
    }
};
//------------------

class Ogre : public Monster {
public:
    void appear() {  std::cout << "appearing an Ogre " <<std::endl;  }
private:
    static MonsterFactoryRegister<Ogre> AddToFactory_;
};

MonsterFactoryRegister<Ogre> Ogre::AddToFactory_("Ogre" );
//------------------

class Demon : public Monster {
public:
    void appear() {  std::cout << "appearing a Demon " <<std::endl;  }
private:
    static MonsterFactoryRegister<Demon> AddToFactory_;
};

MonsterFactoryRegister<Demon> Demon::AddToFactory_("Demon" );
//------------------


class Troll : public Monster {
public:
    void appear() {  std::cout << "appearing a Troll " <<std::endl;  }
private:
    static MonsterFactoryRegister<Troll> AddToFactory_;
};

MonsterFactoryRegister<Troll> Troll::AddToFactory_("Troll" );
//------------------

int main(int argc, char *argv[])
{
    std::vector<Monster*> Monsters;
    
    Monsters.push_back( MonsterFactory::instantiate("Ogre") );
    Monsters.push_back( MonsterFactory::instantiate("Demon") );
    Monsters.push_back( MonsterFactory::instantiate("Troll") );
    
    for (auto& Monster: Monsters){
        Monster->appear();
    }
    
    return 0;
}
