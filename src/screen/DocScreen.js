import React from 'react';
import { View, Text, Button } from 'react-native';
import {NavigationEventSubscription} from "react-navigation";
import NavigationService from '../NavigationService'

class DocScreen extends React.Component {

  static navigationOptions = {
    title: 'DocScreen(RN)',
  }

  didFocus = () => {
    console.log('DetailsScreen didFocus');
  }

  render() {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center'}}>
        <Text> Doc Screen(RN)</Text>
        <Button
          title="Go to Details... again"
          onPress={() => this.props.navigation.push('Doc')}
        />
        <Button
          title="Go back"
          onPress={() => NavigationService.goBack()}
        />
      </View>
    )
  }
}

export default DocScreen;