var People = People || {
  Models: {},
  Collections: {},
  Views: {},
  setup: function() {}
};

People.Models.People = Backbone.Model.extend({});
People.Collections.PeopleCollection = Backbone.Collection.extend({
  model: People.Models.People,
  url: '/people' 
});

People.Views.PersonView = Backbone.View.extend({
  tagName: 'div',
  events: {'click h2': 'makeNameEditable',
          'click p': 'makeEmailEditable',
          'blur input': 'saveNameChanges',
          'keyup input': 'keyboardNameSaveChanges',
          'blur textarea': 'saveEmailChanges',
          'keyup textarea': 'keyboardEmailSaveChanges'
        },
  template: _.template($('#tmpl_person').html()),

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
  },

  render: function() {
    this.$el.html(this.template({ person: this.model}));
    return this;
  },

  makeNameEditable: function(ev) {
    var $target = $(ev.currentTarget);
    var name = $target.text();
    var newInput = $('<input>');
    newInput.val(name);
    $target.replaceWith(newInput);
    newInput.focus();
  },

  makeEmailEditable: function(ev) {
    var $target = $(ev.currentTarget);
    var email = $target.text();
    var newInput = $('<textarea>');
    newInput.val(email);
    $target.replaceWith(newInput);
    newInput.focus();
  },

  keyboardNameSaveChanges: function(ev) {
    if (13 == ev.keyCode) {
      this.saveNameChanges(ev);
    } else if (27 == ev.keyCode) {
      this.render();
    }
  },

  keyboardEmailSaveChanges: function(ev) {
    if (13 == ev.keyCode) {
      this.saveEmailChanges(ev);
    } else if (27 == ev.keyCode) {
      this.render();
    }
  },

  saveNameChanges: function(ev) {
    var $target = $(ev.currentTarget);
    var newName = $target.val();
    this.model.set('name', newName);
    this.model.save();
  },

  saveEmailChanges: function(ev) {
    var $target = $(ev.currentTarget);
    var newName = $target.val();
    this.model.set('email', newName);
    this.model.save();
  }
});

People.Views.PeopleCollectionView = Backbone.View.extend({
  el: '#container',
  render: function() {
    var that = this;
    this.$el.empty();
    this.collection.each(function(personModel) {
      var personView = new People.Views.PersonView({ model: personModel });
      that.$el.append(personView.render().el);
    });
    return this;
  }
});

People.setup = function() {
  var allPeople = new People.Collections.PeopleCollection();
  allPeople.fetch({ success: function() {
    var collectionView = new People.Views.PeopleCollectionView({collection: allPeople});
    collectionView.render();
  }});
};

$(People.setup);

