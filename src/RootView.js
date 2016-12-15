import React, { Component } from 'react';
import {
Text,
} from 'react-native';
import Drawer from 'react-native-drawer';
import MyControlPanel from './ControlPanel';
import tweens from './tweens';
import Button from './Button';
import MyMainView from './MyMainView';

export default class RootView extends Component {

 	 constructor(props, context) {
	    super(props, context);
	    this.state = {
	      drawerType: 'overlay',
	      openDrawerOffset:100,
	      closedDrawerOffset:0,
	      panOpenMask: .1,
	      panCloseMask: .9,
	      relativeDrag: false,
	      panThreshold: .25,
	      tweenHandlerOn: false,
	      tweenDuration: 350,
	      tweenEasing: 'linear',
	      disabled: false,
	      tweenHandlerPreset: null,
	      acceptDoubleTap: false,
	      acceptTap: true,
	      acceptPan: true,
	      tapToClose: false,
	      negotiatePan: false,
	      rightSide: false,
	    };
  	}

  	openDrawer(){
    	this.drawer.open()
  	}

	closeDrawer(){
    	this.drawer.close()
  	}
	setStateFrag(frag) {
	    this.setState(frag);
	}

  	tweenHandler(ratio){
	    if(!this.state.tweenHandlerPreset){ return {} }
	    return tweens[this.state.tweenHandlerPreset](ratio)
  	}

	render() {
		var controlPanel = <MyControlPanel closeDrawer={() => {
      		this.drawer.close();
    	}} />
		return (
		<Drawer
        ref={c => this.drawer = c}
        type={this.state.drawerType}
        animation={this.state.animation}
        openDrawerOffset={this.state.openDrawerOffset}
        closedDrawerOffset={this.state.closedDrawerOffset}
        panOpenMask={this.state.panOpenMask}
        panCloseMask={this.state.panCloseMask}
        relativeDrag={this.state.relativeDrag}
        panThreshold={this.state.panThreshold}
        content={controlPanel}
        disabled={this.state.disabled}
        tweenHandler={this.tweenHandler.bind(this)}
        tweenDuration={this.state.tweenDuration}
        tweenEasing={this.state.tweenEasing}
        acceptDoubleTap={this.state.acceptDoubleTap}
        acceptTap={this.state.acceptTap}
        acceptPan={this.state.acceptPan}
        tapToClose={this.state.tapToClose}
        negotiatePan={this.state.negotiatePan}
        changeVal={this.state.changeVal}
        side={this.state.rightSide ? 'right' : 'left'}
        > 
			 <MyMainView
		        setParentState={this.setStateFrag.bind(this)}
		        openDrawer={this.openDrawer.bind(this)}
          	/>
       	</Drawer>
		);
	}
}