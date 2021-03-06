Template Method
=====================
"Define the skeleton of an algorithm in an operation, deferring some steps to subclasses. Template Method lets subclass es redefine certain steps of an algorithm
without changing the algorithm's structure."

樣板模式, 定義結構給子類別遵守.

# 使用時機
1. 有大量的相同實作時
2. 需要控制子類遵守某些項目時

# 特點
1. 避免程式碼重複
2. 相依性高

# UML
![Template Method pattern UML from wiki](https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Template_Method_UML.svg/450px-Template_Method_UML.svg.png)

# 程式碼
[C++版本](https://github.com/hungchicheng/DesignPattern/blob/master/TemplateMethod/TemplateMethod.cpp)

[Lua版本](https://github.com/hungchicheng/DesignPattern/blob/master/TemplateMethod/TemplateMethod.lua)

# 參考

GOF設計模式

Head First 設計模式

<https://en.wikipedia.org/wiki/Template_method_pattern>

<https://zh.wikipedia.org/wiki/%E6%A8%A1%E6%9D%BF%E6%96%B9%E6%B3%95>
