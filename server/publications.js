// Returns all library and crypt cards.

// Returns the inventory belonging to the user.
Meteor.publish('inventories', function () {
  return Inventories.find({owner: this.userId});
});

Meteor.publish('decks', function () {
  return Decks.find({owner: this.userId});
});

Meteor.publish('deckCards', function () {
  return DeckCards.find({owner: this.userId});
});

Meteor.publish('version', function () {
  return Version.find();
});
