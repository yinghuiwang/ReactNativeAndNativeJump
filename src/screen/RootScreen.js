import React from 'react';
import { View, Text, Button, NativeModules, TouchableHighlight } from 'react-native';
import { StackNavigator, NavigationEventSubscription } from 'react-navigation';


class RootScreen extends React.Component {
  static navigationOptions = {
    title: 'RootScreen(RN)',
  }
  render() {
    return (
      <View style={{backgroundColor: 'white', flex: 1, alignItems: 'center', justifyContent: 'center'}}>
      </View>
    )
  }
}

export default RootScreen;