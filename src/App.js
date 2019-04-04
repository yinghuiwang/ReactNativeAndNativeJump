/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import { Button } from 'react-native';
import { createTabNavigator, createStackNavigator, StackViewTransitionConfigs } from "react-navigation";
import HomeScreen from './screen/HomeScreen'
import DetailsScreen from "./screen/DetailsScreen";
import SettingsScreen from './screen/SettingsScreen';
import HocComponent from './screen/HocComponent'
import DocScreen from './screen/DocScreen'
import HeaderSettingScreen from './screen/HeaderSettingScreen'
import NavigationService from './NavigationService';
import CategoryScreen from './screen/CategoryScreen'
import RootScreen from './screen/RootScreen'
import ReplaceScreen from './screen/ReplaceScreen'

const TabNav = createTabNavigator(
  {
    Home: {
      screen: RootScreen,
    },
    MainTab: {
      screen: HomeScreen,
    },
    SettingsTab: {
      screen: SettingsScreen,
    },
    CategoryScreen: {
      screen: CategoryScreen,
    }
  },
  {
    tabBarPosition: 'bottom',
    animationEnabled: false,
    swipeEnabled: false,
    tabBarOptions: {
      activeTintColor: '#e91e63',
      showLabel: false,
      labelStyle: {
        fontSize: 12,
      },
      style: {
        backgroundColor: '#fff',
      },
    }
  }
)

const RootStack = createStackNavigator(
  {
    Root: {
      screen: TabNav,
    },
    Details: {
      screen: HocComponent(DetailsScreen),
    },
    Doc: {
      screen: HocComponent(DocScreen),
    },
    HeaderSetting: {
      screen:  HocComponent(HeaderSettingScreen),
    },
    Replace: {
      screen:  HocComponent(ReplaceScreen),
    },
  },
  {
    initialRouteName: 'Root',
    transitionConfig: (transitionProps, prevTransitionProps) => ({
      transitionSpec: {
        duration: NavigationService.getTransitionDuration(transitionProps, prevTransitionProps),
      }
    }),
    navigationOptions: ({ navigation }) => {
      return {
        ...NavigationService.navigationOptions(navigation),
      };
    },
  }
  );

class App extends Component<Props> {
  
  render() {
    return <RootStack 
    onNavigationStateChange={NavigationService.listenChange}
    ref={navigatorRef => {
      NavigationService.setTopLevelNavigator(navigatorRef);
    }}
    />;
  }
}

export default App;