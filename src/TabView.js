import React from 'react';
import {PropTypes} from "react";
import {
  StyleSheet,
  Text,
  View,
  Button
} from "react-native";

import { Actions } from 'react-native-router-flux';

const contextTypes = {
  drawer: React.PropTypes.object,
};

const propTypes = {
  name: PropTypes.string,
  sceneStyle: View.propTypes.style,
  title: PropTypes.string,
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
});

const TabView = (props, context) => {
  const drawer = context.drawer;
  return (
    <View style={[styles.container, props.sceneStyle ]}>
      <Text>Tab {props.title}</Text>
      {props.name === 'tab1_1' &&
        <Button onPress={Actions.tab1_2}>next screen for tab1_1</Button>
      }
      {props.name === 'tab2_1' &&
        <Button onPress={Actions.tab2_2}>next screen for tab2_1</Button>
      }
 
      <Button onPress={() => { drawer.close(); Actions.echo(); }} title="push new scene" />
    </View>
  );
};

TabView.contextTypes = contextTypes;
TabView.propTypes = propTypes;

export default TabView;
