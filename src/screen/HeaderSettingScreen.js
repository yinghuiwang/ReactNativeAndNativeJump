import React from 'react';
import { View, Text, Button } from 'react-native';
import {NavigationEventSubscription} from "react-navigation";
import NavigationService from '../NavigationService'

class HeaderSettingScreen extends React.Component {

  static navigationOptions = ({ navigation }) => {
    const { state, setParams } = navigation;
    const { params } = state;

    return {
      headerTitle: (
        <Text numberOfLines={2} style={{width: 100, textAlign: 'center'}}>
          { params ? params.name : 'HeaderSettingScreen' }
        </Text>
      ),
      headerRight:(
        <Button
          title={ params ? (params.mode === 'edit' ? 'Done' : 'Edit') : 'Edit'}
          onPress={() => params.onClictRightBtn()}
        />
      ),
      headerStyle: {
        backgroundColor: 'rgba(255, 0, 0, 1)'
      },
      headerTransparent: true
    }
  }

  componentWillMount() {
    this.props.navigation.setParams({
      name: '测试(RN)',
      mode: 'edit',
      onClictRightBtn: this._onClictRightBtn
    })
  }

  didFocus = () => {
    console.log('DetailsScreen didFocus');
  }

  _onClictRightBtn = () => {
    alert('wyh')
  }

  render() {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center'}}>
        <Text> HeaderSetting Screen(RN)</Text>
        <Button
          title="Go to HeaderSetting... again"
          onPress={() => this.props.navigation.push('HeaderSetting')}
        />
        <Button
          title="Go back"
          onPress={() => NavigationService.goBack()}
        />
      </View>
    )
  }
}

export default HeaderSettingScreen;