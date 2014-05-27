var People = People || {
  Models: {},
  Collections: {},
  Views: {},
  setup: function () {}
};

People.Models.Person = Backbone.Model.extend({});
People.Collections.PersonCollection = Backbone.Collection.extend({
  model: People.Models.Person,
  url: '/people'
});

People.Views.PersonView = Backbone.View.extend({
  tagName: 'div',
  template: _.template($('#tmpl_person').html()),
  render: function() {
    this.$el.addClass('person');
    this.$el.html(this.template({person: this.model}));


    return this;
  }
});

People.Views.PersonCollectionView = Backbone.View.extend({
  el: '#container',
  render: function() {
    var that = this;
    this.$el.empty();
    this.collection.each(function(personModel) {
      var personView = new People.Views.PersonView({model: personModel});
      that.$el.append(personView.render().el);
    });
    return this;
  } // End render function.
});

People.setup = function() {
  var allPeople = new People.Collections.PersonCollection();
  allPeople.fetch({ success: function() { 
    var collectionView = new People.Views.PersonCollectionView({collection: allPeople});
    collectionView.render();
  }});
  
};

$(People.setup);