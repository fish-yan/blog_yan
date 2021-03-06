---
layout:     post
title:      "1.1 UWP应用简介"
subtitle:   " UWP 是 Universal Windows Platform 的简写，即通用 Windows 平台。"
date:       2017-02-23 22:00:00
author:     "FishYan"
header-img: "img/UWP-header.jpg" 
catalog:    true
tags:
    - UWP
---

> UWP 是 Universal Windows Platform 的简写，即通用 Windows 平台。

## 1. 什么是UWP应用

通用 Windows 平台 (UWP) 应用是一种基于通用 Windows 平台 (UWP) 生成的 Windows 应用，它首次在 Windows 8 中引入。UWP 应用对于用户而言， 是一个应用全 Windows 平台使用；对于开发者而言，一次开发，即可运行在所有 Windows 10 设备。目前的 Windows 10 设备覆盖 PC、平板电脑、手机、Xbox、HoloLens、Surface Hub 等。

## 2. UWP 应用有哪些与众不同的特点

- UWP 应用面对的平台，而非某一个系统。用通用核心API的开发的应用可以在任何 Windows 10 设备上运行。
- 所有 UWP 应用均可作为 AppX 程序包进行分配。 这提供了值得信赖的安装机制，并确保应用可以无缝进行部署和更新。
- 公用同一个应用商店， 不管是你的手机，还是电脑，甚至是hub都使用同一个应用商店。
- 除了核心API外，针对不同的设备也有不同的扩展SDK，以适应不同设备所具有的特性。
- 自适应控件，由于 Windows 设备屏幕大小跨度不较大，从手机到hub，在不同屏幕大小的设备上 UI 元素会基于设备上可用的屏幕像素数自动自行调整，以展现良好的视觉效果。

## 3. 如何体验 UWP 应用

首先， 你需要一台安装有 Windows 10 的设备

**最低要求**
```
屏幕：分辨率800x600及以上

消费者版本大于等于8英寸；专业版大于等于7英寸。

固件：UEFI 2.3.1，支持安全启动

内存：2GB（64位版）；1GB（32位版）

存储空间：大于等于16GB（32位版）；大于等于20GB（64位版）

显卡：支持DirectX 9
```
[下载 Windows 10 ](https://www.microsoft.com/zh-cn/software-download/windows10ISO)

日常使用用户建议使用 Windows 10 正式版，还在说 Windows 10 不稳定的人，可以改变一下你一年前的想法了，Windows 10 已经发布一年多了，现在已经很稳定了。并且在运行速度和高分屏的支持，明显优于以前版本。

对于开发人员，建议使用预览版。同时提供快中慢三个通道，可以根据自己的情况选择。预览版的好处在于可以提早体验 Windows 10 新功能。

## 5. UWP 应用推荐

### 社交

1. **QQ** 体验还算不错，虽然功能不多，但是设计和体验都挺好的。

2. **微信** 相比之下比web版要好多了，毕竟用频繁的登录了。

3. **贴吧** 不解释，谁用谁知道 🤗

4. **新浪微博** 可以用，目前发现有严重bug，微博内容会无限重复

### 影音娱乐

1. **网易云音乐** 良心之作，唯一缺点：不能后台播放

2. **爱奇艺** UWP 上最好的视频客户端，没有之一。体验与桌面版基本一致，重点无广告。

3. **搜狐视频** 同样良心之作，无广告

4. **哔哩哔哩** 不解释，看得都懂

5. **hello，tv** 直播神器，来自巨硬工作室，如果你比较喜欢看直播，不要错过了

*其他的自己慢慢发掘*

## 4. 使用哪些语言开发 UWP 应用

UWP 应用可以使用 Windows 运行时，它是一个内置于操作系统的本机 API。 此 API 采用 C++ 实现，并支持 C#、Visual Basic、C++ 和 JavaScript。

至于语言的优劣不作比较，本系列将采用 C# 语言进行开发。