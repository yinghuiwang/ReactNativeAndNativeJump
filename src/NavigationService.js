import { StackActions, NavigationActions } from 'react-navigation';
import { NativeEventEmitter, NativeModules } from 'react-native';
const { DLRouterBridge } = NativeModules;

class NavigationService {
  _navigator; // 全局导航器
  _screenName; // 
  _hideTransition; // rn是否禁止导航动画
  _currentPageParam;

  constructor() {
    _screenName = "";
    _hideTransition = false;
    _currentPageParam = {};
    this.addRouterChangeListener()
  }

  addRouterChangeListener() {
    const bridgeRouterEmitter = new NativeEventEmitter(DLRouterBridge);
    bridgeRouterEmitter.addListener(
      DLRouterBridge.ROUTER_EVENT,
      (reminder) => {
        this.navigateMap(reminder.navigateType, reminder.screenName, reminder.params)
      }
    );
  }
  
  // 设置全局导航器
  setTopLevelNavigator(navigatorRef) {
    _navigator = navigatorRef;
  }

  reset(routeName, params) {
    _navigator._navigation.reset([
      NavigationActions.navigate({ routeName })], 0)
  }

  push(routeName, params) {
    _navigator._navigation.push(routeName, params)
  }

  replace(routeName, params) {
    _navigation.replace(routeName)
  }

  pop() {
    _navigator._navigation.pop()
  }

  goBack(routeName) {
    if(_currentPageParam && _currentPageParam.isGoNative) {
      this.nativePop();
    } else {
      _navigator._navigation.pop()
    }
  }

  navigate(routeName, params) {
    const navigateAction = NavigationActions.navigate({
      routeName: routeName,
      params,
    });
    _navigator.dispatch(navigateAction);
  }

  navigateMap(navigateType, screenName, param) {
    if (!_navigator) {
      return;
    }
    _screenName = screenName;
    _hideTransition = param.hideTransition;
    if (navigateType == DLRouterBridge.NAVIGATE_TYPE_PUSH) {
      this.push(screenName, param);
    } else if(navigateType == DLRouterBridge.NAVIGATE_TYPE_RESET) {
      this.reset(screenName, param);
    } else if(navigateType == DLRouterBridge.NAVIGATE_TYPE_NAVIGATE) {
      this.navigate(screenName, param);
    } else if(navigateType == DLRouterBridge.NAVIGATE_TYPE_POP) {
      this.pop();
    }
  }

  nativePush(screenName, param) {
    DLRouterBridge.navigate(DLRouterBridge.NAVIGATE_TYPE_PUSH, screenName, param);
  }

  nativePop(screenName, param) {
    DLRouterBridge.navigate(DLRouterBridge.NAVIGATE_TYPE_POP, "", param);
  }

  listenChange = (state1, state2, action) => {

    let fromobj = state1.routes[state1.routes.length - 1];
    let from = { name: fromobj.routeName, key: fromobj.key };
    let toobj = state2.routes[state2.routes.length - 1];
    let to = { name: toobj.routeName, key: toobj.key };

    _currentPageParam = toobj.params;
    DLRouterBridge.navigationCompleted(toobj.routeName, state2.isTransitioning);

    if (!state2.isTransitioning) {
        _screenName = "";
        _hideTransition = false;
    }

    if(toobj.params && toobj.params.isGoNative) {
      DLRouterBridge.setRightDrawPopEnabled(true);
    } else {
      DLRouterBridge.setRightDrawPopEnabled(false);
    }

    if(toobj.routeName == "Root") {
      DLRouterBridge.hideBottomBar(false);
    } else {
      DLRouterBridge.hideBottomBar(true);
    }
  }

  navigationOptions = (navigation) => {
    const { state, setParams } = navigation;
    const { params } = state;
    
    let gesturesEnabled = true; 
    if (params && params.gesturesInvalid) {
      gesturesEnabled = false;
    }

    return {
      gesturesEnabled,
    };
  }

  /**
   * 产生跳转动画时间
   * @param {当初跳转props} transitionProps 
   * @param {上一个跳转props} prevTransitionProps 
   */
  getTransitionDuration(transitionProps, prevTransitionProps) {
    let time = 300;
    if (_hideTransition) { 
      if(_screenName === transitionProps.scene.route.routeName || 
        prevTransitionProps && _screenName === prevTransitionProps.scene.route.routeName) {
        time = 0;
      }
    }
    return time;
  }
}

export default new NavigationService()