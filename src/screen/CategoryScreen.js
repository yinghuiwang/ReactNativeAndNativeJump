import React from 'react';
import { View, Text, Button } from 'react-native';
import {NavigationEventSubscription} from "react-navigation";

class CategoryScreen extends React.Component {

  static navigationOptions = {
    title: 'Category(RN)',
  }

  didFocus = () => {
    console.log('CategoryScreen didFocus');
  }

  render() {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center'}}>
        <Text> CategoryScreen Screen(RN)</Text>
        <Button
          title="Go to Details... again"
          onPress={() => this.props.navigation.push('Details')}
        />
        <Button
          title="Go to HeaderSetting"
          onPress={() => this.props.navigation.push('HeaderSetting', {name: "HeaderSetting(RN)"})}
        />
      </View>
    )
  }
}

export default CategoryScreen;