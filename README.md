# ReactNativeAndNativeJump
## 方案一

### 实现方式

采用react-native-navigation，我们注册组件到JavaScript端，例如

```
[ReactNativeNavigation registerExternalComponent:@"RNNCustomComponent" callback:^UIViewController *(NSDictionary *props, RCTBridge *bridge) {
		return [[RNNCustomViewController alloc] initWithProps:props];
	}];
```

## 方案二

采用Ronter方式，在JavaScript和OC、java端都集成Ronter框架，设计出一个三方通用的**组件**，专门负责页面调度

### 跳转方案架构图

![image-20190213095745628](https://ws1.sinaimg.cn/large/006tNc79ly1g04l9o0k6oj31210u0gns.jpg)

### iOS

#### 第三方库

##### [MGJRouter](https://github.com/meili/MGJRouter)

使用方式

```objective-c
[MGJRouter registerURLPattern:@"mgj://foo/bar" toHandler:^(NSDictionary *routerParameters) {
    NSLog(@"routerParameterUserInfo:%@", routerParameters[MGJRouterParameterUserInfo]);
}];

[MGJRouter openURL:@"mgj://foo/bar"];
```

##### [JLRoutes](https://github.com/joeldev/JLRoutes)

### Android

#### 第三方库

##### [ARouter](https://github.com/alibaba/ARouter)

使用方式

```java
// 1. 应用内简单的跳转(通过URL跳转在'进阶用法'中)
ARouter.getInstance().build("/test/activity").navigation();

// 2. 跳转并携带参数
ARouter.getInstance().build("/test/1")
            .withLong("key1", 666L)
            .withString("key3", "888")
            .withObject("key4", new Test("Jack", "Rose"))
            .navigation();
```



##### [Router](https://github.com/chenenyu/Router)

```java
// 简单跳转
Router.build("test").go(this);
// startActivityForResult
Router.build("test").requestCode(0).go(this);
// 携带bundle参数
Router.build("test").with("key", Object).go(this);
// 添加回调
Router.build("test").go(this, new RouteCallback() {
    @Override
    public void callback(RouteStatus status, Uri uri, String message) {
        // do something
    }
});

// 获取路由对应的intent
Router.build("test").getIntent();
// 获取注解的Fragment
Router.build("test").getFragment();
```



- 

### ReactNative

#### 第三方库

##### [react-navigation](https://reactnavigation.org/docs/zh-Hans/getting-started.html)

```javascript

    navigate = (searchTxt, type, param) => {
        if (type == 1) { // 商品详情
            this.props.navigation.navigate('DetailPage', {
                sku: param,
                track:sku => {
                    BiTrack('SearchBarClick', searchTxt, 'DetailPage', sku);
                }
            });
        } else if (type == 2) { // 专题
            this.props.navigation.push('HtmlViewPage', {
                webPath: param,
                img: ''
            });
        } else if (type == 3) { // 频道
            this.props.navigation.navigate('ShopPage');
            emit('top.tab.change', param);
        } else if (type == 4) { // 运营分类
            this.props.navigation.push('SecondCategoryPage', {
                categoryId: param,
                updatePage: () => {
                }
            });
        } else if (type == 5) { // 商品列表
            this.search(searchTxt, true, param, true);
        }
    }

```



##### [react-native-navigation](https://pilipa-cn.github.io/react-native-navigation/)

```objective-c
[ReactNativeNavigation registerExternalComponent:@"RNNCustomComponent" callback:^UIViewController *(NSDictionary *props, RCTBridge *bridge) {
		return [[RNNCustomViewController alloc] initWithProps:props];
	}];
```

## 方案对比

|                         | 优点                                              | 缺点                                                         |
| ----------------------- | ------------------------------------------------- | ------------------------------------------------------------ |
| react-native-navigation | 1. 简单，<br />2. 原生端几乎不用改动就能开发      | 1. js要将react-navigation换成react-native-navigation<br />2. 限制了原生端的灵活性，对后期扩展不利 |
| 全局Ronter方式          | 1.js端改动不大<br />2. 能够保证三端的扩展性<br /> | 1. 设计三方通用的**组件**需要时间                            |
