import React, { Component } from 'react';
import {
  View,
  Text,
  StyleSheet,
  Image,
  TouchableHighlight
 } from 'react-native';



const styles = StyleSheet.create({
  container: {
    flex: 1,
    height: 50,
    flexDirection: 'row'
  },
  photo: {
    height: 40,
    width: 40,
    margin: 5,
  },
  text: {
    flex:1,
    marginLeft: 10,
    fontSize: 17,
    fontWeight: 'bold',
    paddingTop: 12
  },
});


class Row extends Component {
  handleTouch(){

  }

  render(){
    return (
      <TouchableHighlight onPress={this.handleTouch}  underlayColor="#DCDCDC">
        <View style={styles.container}>
          <Image source={this.props.rowData.image} style = {styles.photo}/>
          <Text style = { styles.text } >
            { this.props.rowData.title }
          </Text>
        </View>
      </TouchableHighlight>
    );
  }
}

export default Row;