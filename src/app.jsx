/** @jsx React.DOM */

var React = require('react'),
    injectTapEventPlugin = require("react-tap-event-plugin"),
    Main = require('./components/main.jsx');



if (typeof window !== 'undefined') {
    window.React = React;

    injectTapEventPlugin();
    React.render(
            <Main />,
            document.getElementById('content')
            );
}
module.exports=Main;

