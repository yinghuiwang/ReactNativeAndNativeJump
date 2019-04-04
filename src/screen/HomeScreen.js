import React from 'react';
import { View, Text, Button, NativeModules, TouchableHighlight } from 'react-native';
import { StackNavigator, NavigationEventSubscription } from 'react-navigation';

class CustomBtn extends React.Component {
  render() {
    return(
      <TouchableHighlight style={
        {
          margin: 5, 
          backgroundColor: 'white', 
          padding: 10, 
          borderWidth: 1, 
          borderColor: "#cdcdcd" }
          } underlayColor='#a5a5a5' onPress={this.props.onPress}>
        <Text>{this.props.text}</Text>
      </TouchableHighlight>
    )
  }
}

class HomeScreen extends React.Component {

  static navigationOptions = {
    title: 'Home(RN)',
  }

  render() {
    return (
      <View style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
        <Text>Home Screen(RN)</Text>
        <Button
          title="Go to Details"
          onPress={() => this.props.navigation.push('Details')}
        />
      </View>
    )
  }
}

export default HomeScreen;