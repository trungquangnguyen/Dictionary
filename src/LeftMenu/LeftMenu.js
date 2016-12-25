import React, { Component } from 'react'
import {
	View,
	StyleSheet,
	Text
} from 'react-native'
import Header from './Header'
import ListViewData from './ListView'

const styles = StyleSheet.create({
	container: {
		flex: 1,
		backgroundColor: '#fff'
		},

	header: {
		height: 120,
		opacity: 0.9,
		marginRight: 0,
		marginLeft: 0,
		borderBottomWidth : 0.5,
		borderColor: 'gray'
	}
});

export default class LeftMenu extends Component {
	render(){
		return (
			<View style = {styles.container}>
				<Header style = { styles.header }/>
				<ListViewData style = {{backgroundColor:'red'}} />
			</View>
			)
	}

}


