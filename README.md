# LLRiseTabBar-iOS
仿淘宝闲鱼的TabBar (Objective-C 实现)

## 0x00 为什么做这个
从我由 Android 转 iOS 开发之后，曾接过一个项目，底部的 TabBar 就是设计成中间一个按钮凸起的样子的，平时玩的 App 不多，这样的设计也就在 Instagram 上看到过，但是那时候上网找资源也没找到比较好的 (也有可能是我没找到)，所以那时候就没有做得很好，到后来，突然看到了一些 App 更新之后变成了中间一个按钮凸起的样子，想起了之前想要仿着咸鱼的 TabBar，但是一直没有动手去做，所以现在就动手开始做了。

## 0x01 进度
- 2015-10-19 中午：~~花了一个晚上的时间，没做完，有一个问题是，在自定义的按钮上，没有显示设置好的 image，在系统的 UIButton 上就可以显示。~~ (TMD Google 了好久没解决，原来是我自己忘了在自定义按钮的 ``layoutSubviews`` 方法里面调用父类的 ``layoutSubviews `` 方法 = =||)
- 2015-10-19 下午：~~中间发布按钮图片显示样式未调整好~~
- 2015-10-19 晚上：完成

## 0x02 截图
### 官方 App 截图：
![官方 App 截图](https://github.com/NoCodeNoWife/LLRiseTabBar-iOS/blob/master/Screenshot/Official.png)

### 项目截图：
- PNG:

![](https://github.com/NoCodeNoWife/LLRiseTabBar-iOS/blob/master/Screenshot/LLRiseTabBar-iOS.png)

- GIF:

![](https://github.com/NoCodeNoWife/LLRiseTabBar-iOS/blob/master/Screenshot/llrisedemo.gif)

## 0x03 瑕疵
当点击同城的时候，按钮会有变暗的效果，经过测试，发现是跟图片有关系：
![](https://github.com/NoCodeNoWife/LLRiseTabBar-iOS/blob/master/Screenshot/flaw.png)

## 0x04 Requirements
- iOS 7.0+

## 0x05 编译测试环境
- Xcode 7.0.1 (7A1001)
- iPhone6(9.0) 模拟器
- iPhone5S(8.3) 真机

## License
LLRiseTabBar-iOS is available under the MIT license. See the LICENSE file for more info.