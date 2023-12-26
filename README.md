#  
## 说明
[Objective-C编程之道,iOS设计模式解析](https://github.com/hapiii/DesignPattern/blob/master/imgs/add.gif)
书中代码重写

对移动端来说，内存管理和设计模式是比较重要的两个点。前者有助于实现性能优良，页面流畅的app给用户良好的体验；而后者能有助于写出条理清晰，便于维护迭代的代码,令开发者赏心悦目。
看完这本书后,你会了解到基础的设计模式，在读的过程中可能会有这种感慨“原来我这种写法是XX模式啊!”
了解到这些基础设计模式概念和用法后，有助于在实际开发中根据需要组合出多种高效的组合模式，提高代码可读性，降低耦合。

比如MVC模式用到的模式有:组合(复合视图的组合)，命令(目标-动作,按钮响应)，中介者(Controller)，策略(数据处理单独封装类)，观察者(键盘,横竖屏等)

## 书籍地址
[pdf版本](https://github.com/hapiii/DesignPattern/blob/master/ebook/Objective-C%E8%AE%BE%E8%AE%A1%E6%A8%A1%E5%BC%8F.pdf)

##  paint效果
![image](https://github.com/hapiii/DesignPattern/blob/master/imgs/add.gif)

## 21种设计模式

###  1.原型模式 - Prototype
- 需要创建的对象 对立其他类型创建，类在运行时决定,使用原型实例指定创建对象的种类,并通过复制这个原型创建新的对象.
相当于模型

### 2.工厂模式 - Virtual
- 定义创建对象的接口，让子类决定实例化哪个类
Cocoa Touch 中 
'''
NSNumber numberWithBool:
NSNumber numberWithChar:
'''

### 3.抽象工厂 - AbstractFactory
- 提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类

### 4.生成器 - Builder
- 将一个复杂对象的构建与他的表现分离，使得同样的构建过程可以可以创建不同的表现
Character 游戏角色，有攻击，防御，耐力等属性
CharacterBuilder 角色基类生成器
StandardCharacterBuilder 角色生成器的一个，角色防御和攻击力与其他属性相关
ChasingGame  追逐游戏 两个方法可以构建 角色和敌人
GameClient 游戏客户端，构建了一个角色和敌人

### 5.单例模式 - Singleton
- 保证一个类仅有一个实例，并提供一个访问他的全局访问点
单例模式是一个非常基本且常用的模式，但是日常的一些写法往往不太严谨，比如只是在sharemanager里写了
dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init] ;
}) ;

假如其他同事不知道这是一个单例，调用alloc init，可能生成一个新的对象

### 6.适配器模式
- 将一个类的接口转换成客户希望的另外一种接口.适配器使得原本由于接口不兼容而不能一起工作的类可以一起工作
代理,block

### 7.桥接模式(bridge)
- 将抽象部分与它的实现部分分离,使他们可以独立地变化

### 8.外观模式(Taxicab)
- 为系统的一组接口提供一个统一的接口. 外观定义一个高层接口,让子系统更易于使用.
对一系列接口的二次封装,比如Controller里将 网络请求,显示progress,成功,失败UI展示 统一封装在一个方法里

### 9.中介者模式(Mediator)
- 用一个对象来封装一系列对象的交互方式.中介使各对象不需要显式地相互引用.从而使其耦合松散. 而且可以独立地改变它们之间的交互.
(比如Controller )

### 10.观察者模式
- 定义对象间的一种一对多的依赖关系,当一个对象的状态发生变化时,所有以来于它的对象都得到通知并被自动更新.
使用情景:
1.两种抽象类型相互依赖.将它们封装在各自对象中,就可以对它们单独进行改变和复用
2.对一个对象的改变需要同时改变其他对象,而不知道具体有多少对象有待改变(1对多)
3.一个对象必须通知其他对象,而它又不知道其他对象是什么

### 11.组合模式
- 将对象组合成树形结构以表示“部分-整体”的层次结构.组合使得用户对单个对象和组合对象的使用具有一致性.

### 12. 迭代器模式
- 提供一种方法顺序访问一个聚合对象中各个元素,而又不需要暴漏该对象的内部表示
NSEnumerator 
makeObjectsPerform

### 13.访问者模式
- 表示一个作用于某对象结构中的各元素的操作,他让我们可以在不改变各元素的类的前提下定义作用于这些元素的新操作.
比如Controller数据管理者,网络请求者


### 14.装饰模式
- 动态地给一个类添加一些额外的职责.就扩展功能来说,装饰模式相比生成子类更为灵活.
demo中两种方法:
1.类扩展
2.protocol 重写对象方法,然后基类对象添加代理,在apply里实现效果.调用drawInRect,实现image修改

### 15.责任链模式
- 使多个对象都有机会处理请求,从而避免请求的发送者和接受者之间发生耦合关系,此模式将这些对象连成一条线,并沿这条链条传递请求

### 16. 模版方法
- 定义一个操作中算法的骨架,而将一些步骤延迟到子类中.模版方法使子类可以重新定义算法的某些特定步骤,而不是改变算法的结构
使用场景:
需要一次实现算法的不变部分,并将可变的部分留给子类实现
子类的共同行为应该被提取出来放到公共类
需要控制子类的扩展

### 17.策略模式
- 定义一系列的算法,把他们一个个分装起来,并且使他们可相互替换.本模式可以使得算法可独立于他的客户而变化

### 18.命令模式
- 将请求封装为一个对象,从而可用不同的请求对客户端进行参数优化,对请求排队或记录请求日志,以及支持可撤销的操作.
NSInvocation , NSUndoManager 
### 19. 享元模式(Flyweight)
运用共享技术有效地支持大量细粒度的对象
(cell复用)

### 20.代理模式(Proxy)
- 对其他对象提供一种代理以控制对这个对象的访问
远程代理:虚拟代理懒加载图片
NSproxy

### 21.备忘录模式 (MementoCommand)
- 在不破坏封装的前提下,捕获一个对象的内部状态,并在该对象之外保存这个状态,这样就可以将该状态保存在之前的状态.

