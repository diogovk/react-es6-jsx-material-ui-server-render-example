/** @jsx React.DOM */

var React = require('react');

var CommentBox = React.createClass({
  render() {
    var a = [1,2,3];
    var b = a.map( (x) => x+1);
    return (
      <div className="commentBox">
        Hello, world! I am a CommentBox. { b }. Sucka
      </div>
    );
  }
});
React.render(
  <CommentBox />,
  document.getElementById('content')
);




class Monkey {
  constructor(name) {
    this.name = name;
  }
  see() {
    return 'see';
  }
  do() {
    return 'doo';
  }
}


class Person extends Monkey{
  constructor(name) {
    super(name || "Monkey");
  }
}


var bob = new Person;

console.log([
  bob.name,
  bob.see(),
  '-',
  bob.name,
  bob.do(),
].join(' '));




