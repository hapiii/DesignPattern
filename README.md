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
讲一个复杂对象的构建与他的表现分离，使得同样的构建过程可以可以创建不同的表现
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





