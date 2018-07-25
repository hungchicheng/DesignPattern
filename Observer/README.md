Observer
=====================
"Define a one-to-many dependency between objects so that when one object
changes state, all its dependents are notified and updated automatically.
"
# 介紹
Object Behavioral物件的合作所構成

一對多的狀況下, 當自身改變時通知所有觀察者.

# 使用

## 時機
- 當物件本身會影響其他物件, 卻又無法估計所影響範圍時.
- 當物件需通知其他物件, 卻不確定通知細節及影響時.

## 方式
主要分成4類別
- Subject : 給Observer觀察的主題, 並且提供interface來加入觀察or取消觀察

- Observer : 會有一個updating的interface來接受狀態改變的通知

- ConcreteSubject : 繼承Subject, 儲存Observer想觀察的目標, 實作狀態改變時通知ConcreteObserver

- ConcreteObserver : 繼承Observer, 管理與ConcreteSubject的關係, 並且保持與主題的一致性, 實作給update給ConcreteSubject

![Observer pattern UML](https://en.wikipedia.org/wiki/File:Observer_w_update.svg)

## 舉例(遊戲開發)
- RXLua( Reactive Extensions for Lua )
- 玩家財產的變化
- 課金後的寶石&VIP變化
- 

# 特點
1. 減少程式相依性
2. 新增新的Observer時, 不會影響到其他Subject/Observer
3. 

# 參考

GOF設計模式

Head First 設計模式

<https://en.wikipedia.org/wiki/Singleton_pattern>

<https://zh.wikipedia.org/zh-tw/%E5%8D%95%E4%BE%8B%E6%A8%A1%E5%BC%8F>