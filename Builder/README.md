Builder
=====================
"Separate the construction of a complex object from its representation so that the
same construction process can create different representations."


# 使用時機
1. 當創建複雜對象的算法應該獨立於該對象的組成部分以及它們的裝配方式時
2. 當構造過程必須允許被構造的對象有不同的表示時

# 特點
<!-- 1. 
2. 
Allows you to vary a product’s internal representation.
Encapsulates code for construction and representation.
Provides control over steps of construction process.


3. 需要建很多的ConcreteBuilder給每一個不同的形態

Requires the builder classes to be mutable.
Data members of class aren't guaranteed to be initialized.
Dependency injection may be less supported. -->

# UML
![Builder pattern UML from wiki](https://upload.wikimedia.org/wikipedia/commons/8/87/W3sDesign_Builder_Design_Pattern_UML.jpg)

# 程式碼
<!-- [C++版本](https://github.com/hungchicheng/DesignPattern/blob/master/Builder/Builder.cpp)

[Lua版本](https://github.com/hungchicheng/DesignPattern/blob/master/Builder/Builder.lua) -->

# 參考

GOF設計模式

<!-- Head First 設計模式 本篇沒有-->

<https://en.wikipedia.org/wiki/Builder_pattern>

<https://zh.wikipedia.org/wiki/%E7%94%9F%E6%88%90%E5%99%A8%E6%A8%A1%E5%BC%8F>
