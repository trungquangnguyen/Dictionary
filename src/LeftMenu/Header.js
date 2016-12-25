import React, { Component } from 'react'
import {
	View,
	Text,
	Image,
	StyleSheet,
	TouchableHighlight
} from 'react-native'
import _dictionaryImage from '../Resource/Dictionary_converted.png'

const styles = StyleSheet.create({
	containter: {
		flexDirection: 'row',
		height: 50,
	},
	image: {
		margin: 2,
		marginLeft: 10,
		width: 46,
		height: 46,
	},
	contenterTitle: {
		flex: 1,
		alignItems: 'center',
		justifyContent: 'center',
		borderBottomWidth : 0.5,
		borderColor: 'gray'
	},
	textTitle:{
		fontSize: 15,
		fontWeight: 'bold',
		fontStyle: 'italic'
	},
	containterMessage: {
		flex: 1,
		alignItems: 'center',
		justifyContent: 'center'
	},
	textMessage: {
		fontSize: 15,
		fontStyle: 'italic',
		margin: 20,
		textAlign : 'center'
	}
})

export default class Header extends Component {
	constructor(props) {
	    super(props);
	    this.state = {
	    	title: 'AMERICAN ENGLISH',
	    	message: 'This is Alpha Version, continue update ...'
	    };
  	}

	render(){
		return (
			<View style = {this.props.style} >
				<View style ={ styles.containter}>
					<Image source = {_dictionaryImage} style = {styles.image} />
					<View style = {styles.contenterTitle}>
						<Text style = {styles.textTitle}> {this.state.title} </Text>
					</View>
				</View>
				<View style = {styles.containterMessage}>
						<Text style = {styles.textMessage}> {this.state.message} </Text>
				</View>
			</View>
		)
	};
}