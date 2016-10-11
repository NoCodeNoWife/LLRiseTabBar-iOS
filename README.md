# LLRiseTabBar-iOS
仿淘宝闲鱼的TabBar (Objective-C 实现)

## 0x00 为什么做这个
从我由 Android 转 iOS 开发之后，曾接过一个项目，底部的 TabBar 就是设计成中间一个按钮凸起的样子的，平时玩的 App 不多，这样的设计也就在 Instagram 上看到过，但是那时候上网找资源也没找到比较好的 (也有可能是我没找到)，所以那时候就没有做得很好，到后来，突然看到了一些 App 更新之后变成了中间一个按钮凸起的样子，想起了之前想要仿着咸鱼的 TabBar，但是一直没有动手去做，所以现在就动手开始做了。

### Android 版
Android 版在 [这里](https://github.com/NoCodeNoWife/LLRiseTabBar-Android)

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
- ~~当点击同城的时候，按钮会有变暗的效果，经过测试，发现是跟图片有关系~~ ([@devtofu](https://github.com/devtofu) 给出了 [解决办法](https://github.com/NoCodeNoWife/LLRiseTabBar-iOS/issues/1))：

/* -------------------- 2016-10-11 更新 -------------------- */

其实不用覆写 ``setHighlighted:`` 方法，只要设置 UIButton 的 ``adjustsImageWhenHighlighted`` 为 ``NO`` 就可以了。

![](https://github.com/NoCodeNoWife/LLRiseTabBar-iOS/blob/master/Screenshot/flaw.png)

- 因为 LLTabBarItem 是继承自 UIButton 的，在设置了 ViewController 的 tabBarItem 之后，在系统的 UITabBar 中生成的实际上是 UITabBarButton(通过 Reveal 看到的)，而 UITabBarButton 是继承自 UIControl 的，所以和继承 UIButton 的效果有所差别，并没有和系统的 UITabBar 效果一样。感兴趣的可以继承 UIControl 试试看。

## Usage
``` Objective-C
UITabBarController *tabBarController = [[UITabBarController alloc] init];
tabBarController.viewControllers = @[...];

LLTabBar *tabBar = [[LLTabBar alloc] initWithFrame:tabBarController.tabBar.bounds];
tabBar.tabBarItemAttributes = @[@{kLLTabBarItemAttributeTitle : @"首页", kLLTabBarItemAttributeNormalImageName : @"home_normal", kLLTabBarItemAttributeSelectedImageName : @"home_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                @{kLLTabBarItemAttributeTitle : @"同城", kLLTabBarItemAttributeNormalImageName : @"mycity_normal", kLLTabBarItemAttributeSelectedImageName : @"mycity_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                @{kLLTabBarItemAttributeTitle : @"发布", kLLTabBarItemAttributeNormalImageName : @"post_normal", kLLTabBarItemAttributeSelectedImageName : @"post_normal", kLLTabBarItemAttributeType : @(LLTabBarItemRise)},
                                @{kLLTabBarItemAttributeTitle : @"消息", kLLTabBarItemAttributeNormalImageName : @"message_normal", kLLTabBarItemAttributeSelectedImageName : @"message_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                @{kLLTabBarItemAttributeTitle : @"我的", kLLTabBarItemAttributeNormalImageName : @"account_normal", kLLTabBarItemAttributeSelectedImageName : @"account_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)}];
tabBar.delegate = self;
[tabBarController.tabBar addSubview:tabBar];
```

## 0x04 Requirements
- iOS 7.0+

## 0x05 编译测试环境
- Xcode 7.0.1 (7A1001)
- iPhone6 (9.0) 模拟器
- iPhone5S (8.3) 真机

## License
LLRiseTabBar-iOS is available under the MIT license. See the LICENSE file for more info.

