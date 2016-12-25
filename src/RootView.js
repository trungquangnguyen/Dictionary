import React, { Component }  from 'react'
import {
Platform
} from 'react-native'
import {
Router,
Scene,
Reducer
}from 'react-native-router-flux'
import NavigationDrawer from './NavigationDrawer'
import TabView from './TabView'
import TabIcon from './TabIcon'

const reducerCreate = params => {
  const defaultReducer = new Reducer(params);
  return (state, action) => {
    console.log('ACTION:', action);
    return defaultReducer(state, action);
  };
};

// define this based on the styles/dimensions you use
const getSceneStyle = (/* NavigationSceneRendererProps */ props, computedProps) => {
  const style = {
    flex: 1,
    backgroundColor: '#DCDCDC',
    shadowColor: null,
    shadowOffset: null,
    shadowOpacity: null,
    shadowRadius: null,
  };
  if (computedProps.isActive) {
  	if (Platform.OS === 'ios') {
  		style.marginTop = computedProps.hideNavBar ? 0 : 64;
  	}
    else {
    	style.marginTop = computedProps.hideNavBar ? 0 : 54;
    }
    style.marginBottom = computedProps.hideTabBar ? 0 : 50;
  }
  return style;
};

export default class RootView extends Component {
	render() {
		return (
			<Router createReducer={reducerCreate} getSceneStyle={getSceneStyle}>
	            <Scene key="root" component={NavigationDrawer}>
	              <Scene key="tabbar" tabs >
	                <Scene key="tab5" component={TabView} title="US-EN" icon={TabIcon} />
	              </Scene>
	            </Scene>
      </Router>
		)
	}
}