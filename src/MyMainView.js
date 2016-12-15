import React, { Component } from 'react';
import {
  Switch,
  SliderIOS,
  PickerIOS,
  PickerItemIOS,
  View,
  ScrollView,
  Text,
  StyleSheet,
  Platform,
  Button
} from 'react-native';



export default class MyMainView extends Component {
  setParentState(args){
    this.props.setParentState(args)
  }

  render(){
    return (
          <Button
            onPress={this.props.openDrawer}
            title="Open Drawer"
            />
    )
  }
}
