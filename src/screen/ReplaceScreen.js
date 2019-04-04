import React from 'react';
import { View, Text, Button, NativeModules, TouchableHighlight } from 'react-native';
import { StackNavigator, NavigationEventSubscription } from 'react-navigation';
import NavigationService from '../NavigationService'

class ReplaceScreen extends React.Component {
  render() {
    const { navigation } = this.props;
    return (
      <View style={{backgroundColor: 'white', flex: 1, alignItems: 'center', justifyContent: 'center'}}>
        
      </View>
    )
  }
}

export default ReplaceScreen;