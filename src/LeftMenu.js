import React, { Component } from 'react'
import {
View,
StyleSheet,
Text
} from 'react-native'

const style = StyleSheet.create({
	container: {
		flex: 1,
		backgroundColor: '#fff'
		},

	header: {
		height: 120,
		backgroundColor: '#2273D6',
		opacity: 0.9,
		marginRight: 0,
		marginLeft: 0
	}
});

export default class LeftMenu extends Component {
	render(){
		return (
			<View style = {style.container}>
				<View style = {style.header}>
					<Text> Header o ddaay</Text>
				</View>

				<View>
					<Text> List View O day</Text>
				</View>
			</View>
			)
	}

}


