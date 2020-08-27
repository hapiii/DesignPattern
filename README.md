#  
###  paint效果
![image](https://github.com/hapiii/DesignPattern/blob/master/imgs/add.gif)
###  3.原型模式 - Prototype
相当于模型
- 需要创建的对象 对立其他类型创建，类在运行时决定

### 4.工厂模式 - Virtual
定义创建对象的接口，让子类决定实例化哪个类
Cocoa Touch 中 
'''
NSNumber numberWithBool:
NSNumber numberWithChar:
'''

### 5.抽象工厂 - AbstractFactory
提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类

### 6.生成器 - Builder
将一个复杂对象的构建与他的表现分离，使得同样的构建过程可以可以创建不同的表现
Character 游戏角色，有攻击，防御，耐力等属性
CharacterBuilder 角色基类生成器
StandardCharacterBuilder 角色生成器的一个，角色防御和攻击力与其他属性相关
ChasingGame  追逐游戏 两个方法可以构建 角色和敌人
GameClient 游戏客户端，构建了一个角色和敌人

### 7.单例模式 - Singleton
保证一个类仅有一个实例，并提供一个访问他的全局访问点
单例模式是一个非常基本且常用的模式，但是日常的一些写法往往不太严谨，比如只是在sharemanager里写了
dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init] ;
}) ;

假如其他同事不知道这是一个单例，调用alloc init，可能生成一个新的对象



### 10.外观模式
为系统的一组接口提供一个统一的接口. 外观定义一个高层接口,让子系统更易于使用.

### 11.中介者模式
用一个对象来封装一系列对象的交互方式.中介使各对象不需要显式地相互引用.从而使其耦合松散. 而且可以独立地改变它们之间的交互.
(比如Controller )

### 12.观察者模式
定义对象间的一种一对多的依赖关系,当一个对象的状态发生变化时,所有以来于它的对象都得到通知并被自动更新.
使用情景:
1.两种抽象类型相互依赖.将它们封装在各自对象中,就可以对它们单独进行改变和复用
2.对一个对象的改变需要同时改变其他对象,而不知道具体有多少对象有待改变(1对多)
3.一个对象必须通知其他对象,而它又不知道其他对象是什么

### 13.组合模式


### 14. 迭代器模式
提供一种方法顺序访问一个聚合对象中各个元素,而又不需要暴漏该对象的内部表示
NSEnumerator 
makeObjectsPerform

