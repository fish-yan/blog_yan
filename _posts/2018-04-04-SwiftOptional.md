---
layout:     post
title:      "3. Swift 中的可选值"
subtitle:   "Swift"
date:       2018-04-04 22:00:00
author:     "FishYan"
header-img: "img/blog-header.png" 
catalog:    true
tags:
    - iOS
    - Swift
---

> Swift 中较为重要的就是可选值的加入。这也使 Swift 更加灵活，同时也保证了尽可能少的出错。区别于 OC，在 OC 中没有可选类型这一概念，所有的类型都有可能存在为 nil 的情况，但是在 Swift 中，在声明一个实例的时候就可以告诉他是否可以为 nil。

比如在 OC 中声明```NSString *str = nil```是完全没有问题的，但是在 Swift 中，如果你声明 ```let str: String = nil``` 这样是一定会报错的，因为在声明的时候已指定了 str 的类型为 String，而不能为 nil。那么要怎么声明一个可以为 nil 的实例呢？```let str: String? = nil```, ```?```表示了这个实例可以为 nil。

### 1.非可选值

前面文章中所用到的声明实例的方法基本都是声明为非可选类型，这样就保证了实例中不能有 nil 的出现，避免了一些值可能为空造成的 crash。
```
var a = "abc"
var arr = ["2", "3"]
var dict = ["2": "a"]
```
这些创建实例都是非可选值，不能把 nil 赋值给他,如 a 变量 ~~a = nil~~, 这么写是会报错的。

那如果是声明的时候不赋值呢？```var a``` ?，这样吗？

很明显这样是错的，Swift 强调类型安全，绝对不会允许你声明一个不知道什么类型的实例。 所以不管是局部变量还是属性都可以用以下方式声明：

```
var a: String

var b: String!
```
这两种方式有什么区别呢？为什么 b 的声明要加一个```!```？为什么在声明 a 的时候回有错误提示？

这是因为声明的 a 和 b 是非可选类型，它必须有一个值，使用 a 的方式声明，那么就必须在 init 初始化方法中对 a 进行初始化，如果没有在 init 方法中进行初始化编译器就会报错来提示你。使用 b 的声明方式，后面的感叹号是告诉编译器，b 我一定有值就不要报错啦，但是在使用之前也必须进行初始化。

### 2.可选值

可选值要尽可能的避免去使用，原则上能用非可选值就不要用可选值。但是可选值也是很必要的，做开发有些值为 nil 这是不可避免的，如果你把一个 nil 赋值给一个非可选的变量，这时候就会出错了。

```
var a: String? = "2"

a = nil

let arr: [String]? = ["a"]

let count = arr?.count // count 为可选类型
```
在可选值的链式调用中如果其中有一个环节的返回值为可选类型，那么最终的返回值就为可选类型。

可选值允许了 nil 的存在，那么在使用的时候就需要判断值是否为 nil。如果为 nil 是否能进行下一步操作。这就涉及到了可选值的解包

### 3.解包

解包的过程就是把可选值变为非可选值，分为强制解包和非强制解包。

1. 强制解包，强制解包很简单，也很暴力，就像上面声明非可选类型的 b 时一样，直接告诉编译器它变成非可选值了。

```
var a: String? = "2"

let b = a!
```
在可选值的后面加一个感叹号，强制解包，这么写就是告诉编译器 a 的值一定不为 nil，一旦 a 的值为 nil 就会解包失败，所以这种写法是会造成灾难的。
平时在开发过程中，除非你非常肯定以及确定 a 的值一定不会为 nil 才可以这么写，但还是不建议。

2. 非强制解包：正确的解包姿势，在 Swift 中提供了两种解包方式 ```if let...``` 和 ```guard let...else```
```
if let b = a {
    print(b)
}

guard let b = a else {
    return
}
```
这样解包出来的 b 是非可选值，并且如果 a 为 nil 的情况下就不会进行解包。

```if let...``` 和 ```guard let...else```的区别：

从字面意思上就可以理解，使用```if let...```的时候你下面所需要执行的代码是需要写在 if 的条件语句块里，而```guard let...else```是下面所需要执行的代码应该写在```guard let...else```后面，因为如果 a 为 nil 会直接 return。这两种分别适应不同的情况，根据项目的实际情况选择不同的解包方式。

在可选值与非可选值的使用上，对于刚从 OC 转入 Swift 的开发者可能会稍微有一些难以理解，因为这是一个新的概念，我在这里也只是简单的介绍一下，帮助入门，要记住一下几点：

1. 合理的使用可选值和非可选值，避免滥用可选值。

2. 对可选值避免自信的使用强制解包

3. 在不确定值是否为 nil 的情况下需要使用可选值

剩下的还是靠自己去悟，去理解。