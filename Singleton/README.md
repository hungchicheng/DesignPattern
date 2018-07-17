Singleton
=====================
"Ensure a class only has one instance, and provide a global point of access to it.
"
# 介紹

- 歸類在Creational Patterns中, 主要目標是產生物件並讓系統獨立.

- 確保Class的本身只有一個實體, 並且可供全域呼叫到同個實體.

# 使用實機

當classes最好只擁有唯一實體時, 並且不用像global一樣常駐, 當使用到這個物件時在創建, 之後的每次只會存取到同個實體.

例如: 
- Cocos2dx Director
- 網路的連接
- 存讀檔案的管理
- 音樂音效的控制

# 特點

1. 控制單一實體. (也只有一個實體, 不會重複創建)
2. 也可減少name space的使用.
3. 創建後不被釋放

# 參考

GOF設計模式

Head First 設計模式

<https://en.wikipedia.org/wiki/Singleton_pattern>

<https://zh.wikipedia.org/zh-tw/%E5%8D%95%E4%BE%8B%E6%A8%A1%E5%BC%8F>
