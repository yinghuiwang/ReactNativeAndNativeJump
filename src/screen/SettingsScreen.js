import React from 'react';
import { Button, ScrollView, StatusBar, Text } from 'react-native';
import { SafeAreaView, StackNavigator, TabNavigator } from 'react-navigation';
import NavigationService from '../NavigationService'

class SettingsScreen extends React.Component {

  static navigationOptions = {
    title: 'settings(RN)',
  }

  render() {
    return (
      <SafeAreaView style={{flex: 1, alignItems: 'center', justifyContent: 'center'}} forceInset={{ horizontal: 'always'}}>
      <Text>Settings Screen(RN)</Text>
      <Button
          title="Go to Details"
          onPress={() => {
            this.props.navigation.push('Details');
          }}
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
      </SafeAreaView>

    )
  }
}

export default SettingsScreen