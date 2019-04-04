import React from 'react';
import { View, Text, Button, ScrollView} from 'react-native';
import {NavigationEventSubscription} from "react-navigation";
import NavigationService from '../NavigationService'

class DetailsScreen extends React.Component {

  static navigationOptions = {
    title: 'Details(RN)',
  }

  didFocus = () => {
    console.log('DetailsScreen didFocus');
  }

  render() {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center', backgroundColor: '#880000'}}>
        <Text> Details Screen(RN)</Text>
        <Button
          title="Go to Details... again"
          onPress={() => this.props.navigation.push('Details')}
        />
        <Button
          title="Go to HeaderSetting"
          onPress={() => this.props.navigation.push('HeaderSetting', {name: "HeaderSetting(RN)"})}
        />
        <Button
          title="Go 原生"
          onPress={() => NavigationService.nativePush("YHTestViewController", {"fromScreenName": "Details"})}
        />
        <Button
          title="Go back"
          onPress={() => NavigationService.goBack()}
        />
        <ScrollView>
          <Text>setting1</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting2</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting3</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting4</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting10</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting</Text>
          <Text>setting10</Text>
        </ScrollView>
      </View>
    )
  }
}

export default DetailsScreen;