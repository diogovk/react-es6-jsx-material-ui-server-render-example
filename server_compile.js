
var React = require('react');
var fs = require("fs");
var Main = React.createFactory(require('./build/app'));

var markup = React.renderToString( Main({}) );

var Hogan = require("hogan.js");
var template = Hogan.compile(fs.readFileSync('public/index.html.in').toString());
fs.writeFileSync('public/index.html',template.render({server_rendered: markup}));
