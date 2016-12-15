import React, { Component } from 'react';
import {
  SwitchIOS,
  View,
  Text,
  Button
} from 'react-native';

import styles from './styles';

export default class ControlPanel extends Component {
  render() {
    return (
      <View style={styles.controlPanel}>
        <Button
          onPress={() => {
            this.props.closeDrawer();
          }}
          title="Close Drawer"
          color="#841584"
          accessibilityLabel="Learn more about purple"
        />
      </View>
    )
  }
}
