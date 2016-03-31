var React = require('react');

var Tabs = React.createClass({
  getInitialState: function(){
    return({activeTab: 3});
  },

  clickHandler: function(e){
    var key = e.target.getAttribute("data-index");
    console.log(key);
    this.setState({activeTab: key});
  },

  showTabs: function(){
    var tabTitles = [];
    var self = this;
    this.props.content.forEach(function(tab, idx){
      var thisTab =
        <span
          onClick={self.clickHandler}
          key={idx}
          data-index={idx}
          num={idx}>
            {tab["title"]}
        </span>;
      if (self.state.activeTab == idx){
        thisTab = <strong>{thisTab}</strong>;
      }
      tabTitles.push(thisTab);
    });
    // tabTitles = tabTitles.toString();
    return (<nav>{tabTitles}</nav>);
  },
  showContent: function(){
    // var self = this;
    // debugger;
    return (<div>
      {this.props.content[this.state.activeTab].content}
    </div>);
  },
  render: function(){
    return (<div>
        {this.showTabs()}
        {this.showContent()}
      </div>);
  }
});

module.exports = Tabs;
