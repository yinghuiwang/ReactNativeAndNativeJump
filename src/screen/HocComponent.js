import React from 'react';
import { Button } from 'react-native'
import {NavigationEventSubscription} from "react-navigation";
import NavigationService from '../NavigationService';

const HocComponent = (WrappedComponent: React.DOM) => class extends React.Component{

  static navigationOptions = ({ navigation }) => {

    return {
      ...WrappedComponent.navigationOptions,
      headerLeft: (
        <Button title={'<---'} onPress={() => {
          NavigationService.goBack();
        }}/>
      )
    }
  }

  constructor(props) {
    super(props);
  }

  _s0: NavigationEventSubscription;
  _s1: NavigationEventSubscription;
  _s2: NavigationEventSubscription;
  _s3: NavigationEventSubscription;
  screen: React.Component;

  componentDidMount = () => {
    this._s0 = this.props.navigation.addListener('willFocus', this._onWF);
    this._s1 = this.props.navigation.addListener('didFocus', this._onDF);
    this._s2 = this.props.navigation.addListener('willBlur', this._onWB);
    this._s3 = this.props.navigation.addListener('didBlur', this._onDB);
    console.log(this.refs);
  }


  componentWillUnmount = () => {
    this._s0.remove();
    this._s1.remove();
    this._s2.remove();
    this._s3.remove();
  }

  _onWF = a => {
    console.log('_willFocus ...', a);
  };
  _onDF = a => {
    console.log('_didFocus ...', a);
    if (this.screen && this.screen.didFocus) {
      this.screen.didFocus();
    }
  };
  _onWB = a => {
    console.log('_willBlur ...', a);
  };
  _onDB = a => {
    console.log('_didBlur ...', a);
  };

  render () {
    return (
      <WrappedComponent {...this.props} ref={ref => {
        this.screen = ref
      }}/>
    )
  }
}


export default HocComponent;