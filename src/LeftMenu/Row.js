import React from 'react';
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


const Row = (props) => (
    <View style={styles.container}>
      <Image source={props.rowData.image} style = {styles.photo}/>
      <Text style = { styles.text } >
        { props.rowData.title }
      </Text>
    </View>
);

export default Row;