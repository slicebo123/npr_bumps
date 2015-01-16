var React = require('react'),
    SubscriptionItem = require('./SubscriptionItem.js.jsx'),
    _ = require('lodash'),
    mui = require('material-ui'),
    RaisedButton = mui.RaisedButton;

var SubscriptionList = React.createClass({
  getInitialState: function () {
    return {
      dirtySubscriptionsForm: false,
      subscriptions: [],
      masterSubscriptions: []
    };
  },

  componentWillReceiveProps: function (nextProps) {
    var self = this;
    this.getSubscriptionsForPlaylist(nextProps.playlistItem).then(function (response) {
      self.setState({
        masterSubscriptions: response,
        subscriptions: _.cloneDeep(response)
      })
    });
  },

  getSubscriptionsForPlaylist: function (playlistItem) {
    var playlistId = playlistItem.id,
        api = new prBumpsApi();

    return api.getSubscriptions(playlistId);
  },

  onChangeHandler: function (playlistId, subscribed) {
    // update subscriptions.subscribed value for correct playlist
    var newSubscriptions = this.state.subscriptions;
    var masterSubscriptions = this.state.masterSubscriptions;
    var playlist = _.find(newSubscriptions, {id: playlistId});

    // set value on playlistItem
    playlist.subscribed = subscribed;
    // check if value we are setting is different from original form
    var isFormDirty = this.isSubscriptionFormDirty(masterSubscriptions, newSubscriptions);
    // update state
    this.setState({
      subscriptions: newSubscriptions,
      dirtySubscriptionsForm: isFormDirty
    });
  },

  isSubscriptionFormDirty: function (oldList, newList) {
    return !_.isEqual(oldList, newList);
  },

  render: function() {
    var self = this;
    var subscriptionItems = this.state.subscriptions.map(function (subscription) {
      return (
        <SubscriptionItem onChangeHandler={self.onChangeHandler} name={subscription.name} programId={subscription.id} key={subscription.id} subscribed={subscription.subscribed} />
      )
    });

    return (
      <div className="subscription-index">
        <h3>{this.props.playlistItem.name}</h3>
        <form>
          <input type="hidden" id="playlistId" name="playlistId" value={this.props.playlistItem.id}/>
          {subscriptionItems}
        </form>
        <div className="primary-action-button">
          <RaisedButton label="Update Subscription" secondary={true}/>
        </div>
        <RaisedButton label="Discard Changes" />
      </div>
    );
  }

});

module.exports = SubscriptionList;
