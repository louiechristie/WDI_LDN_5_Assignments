var People = People || {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  setup: function () {}
};

People.Models.Person = Backbone.Model.extend({});
People.Collections.PersonCollection = Backbone.Collection.extend({
  model: People.Models.Person,
  url: '/people'
});

// show a single person
People.Views.PersonView = Backbone.View.extend({
  tagName: 'div',
  template: _.template($('#tmpl_person').html()),
  render: function() {
    this.$el.addClass('person');
    this.$el.html(this.template({person: this.model}));


    return this;
  }
});

// Show all people
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

// Show the form for a new person.
People.Views.PersonCreationView = Backbone.View.extend({
  el: '#container',
  events: {'submit form': 'createNewPerson'},
  template: _.template($('#tmpl_newperson').html()),

  render: function() {
    this.$el.html(this.template());
    return this;
  },

  createNewPerson: function(ev) {
    ev.preventDefault();
    var name = $('input[name="name"]').val();
    var email = $('input[name="email"]').val();
    var url = $('input[name="url"]').val();
    var person = new People.Models.Person({name: name, email: email, url: url});
    People.allPeople.add(person);
    person.save();
    People.router.navigate("", {trigger: true});
  }
});

People.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "showIndex",
    "new": "createNewPerson"
  },

  showIndex: function() {
    var collectionView = new People.Views.PersonCollectionView({collection: People.allPeople});
    collectionView.render();
  },

  createNewPerson: function() {
    new People.Views.PersonCreationView().render();
  }
});

People.setup = function() {
  People.router = new People.Routers.AppRouter();
  People.allPeople = new People.Collections.PersonCollection();
  People.allPeople.fetch({ success: 
    People.router.showIndex
  });
  Backbone.history.start();
};

$(People.setup);