
var React = require('react');
    mui = require('material-ui'),
    RaisedButton = mui.RaisedButton;

var CommentBox = React.createClass({
    render() {
        var a = [1,2,3];
        var b = a.map( (x) => x+1);
        return (
                <div className="commentBox">
                <h1> Sum </h1>
                Hello, world! I am a CommentBox. { b }. Sucka
                <RaisedButton label="Dood!" primary={true} onTouchTap={this.handleTouchTap} />
                </div>
               );
    },
    handleTouchTap() {
        alert("oh hi");
    }

});

module.exports = CommentBox;
