import React, { Component } from 'react'
import {
	ListView,
	Text,
 	View
} from 'react-native'
import Row from './Row'
import _oxfordIcon from '../Resource/Oxford_Dictionary_English_plus_Audio_Icon.png'
import _en_vnIcon from '../Resource/english_vn.png' 
import _history from '../Resource/history.png' 
import _wordList from '../Resource/wordList.png'
import _translation from '../Resource/translation.png'
import _settings from '../Resource/settings.png'

export default class ListViewData extends Component {
	constructor(props) {
	    super(props);
	    const ds = new ListView.DataSource({rowHasChanged: (r1, r2) => r1 !== r2});
	    this.state = {
	      dataSource: ds.cloneWithRows([
	        {image:_oxfordIcon,title:'Oxford Dictionary'},
	        {image:_en_vnIcon,title:'English-VN'}, 
	        {image:_history,title:'Historys'}, 
	        {image:_wordList,title:'WordLists'}, 
	        {image:_translation,title:'Translate Sentences'}, 
	        {image:_settings,title:'Setting'}, 
	        // {image:_oxfordIcon,title:'Rating'}, 
	        // {image:_oxfordIcon,title:'Feedback'}, 
	        // {image:_oxfordIcon,title:'Share'}
	      ])
	    };
  	}

  	render() {
	    return (
	      <View style={{flex: 1}}>
	        <ListView
	          dataSource={this.state.dataSource}
	          renderRow={this._renderRow.bind(this)}
	        />
	      </View>
	    );
	}

	_renderRow(rowData, sectionID, rowID) {
        return (
            <Row rowData = { rowData } />
        );
    }
}