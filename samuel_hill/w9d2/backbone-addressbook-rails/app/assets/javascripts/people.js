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

People.Views.PeopleView = Backbone.View.extend({
  tagName: 'div',
  template: _.template($('#tmpl_person').html()),
  render: function() {
    this.$el.html(this.template({ person: this.model}));
    return this;
  }
});

People.Views.PeopleCollectionView = Backbone.View.extend({
  el: '#container',
  render: function() {
    var that = this;
    this.$el.empty();
    this.collection.each(function(personModel) {
      var personView = new People.Views.PeopleView({ model: personModel });
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

