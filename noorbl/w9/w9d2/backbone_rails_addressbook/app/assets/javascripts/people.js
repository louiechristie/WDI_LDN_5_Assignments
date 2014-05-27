var People = People || {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  setup: function() {}
}

People.Models.Person = Backbone.Model.extend({});
People.Collections.PersonCollection = Backbone.Collection.extend({
  model: People.Models.Person,
  url: '/people'
});


People.Views.PersonView = Backbone.View.extend({
  tagName: 'div',
  events: {'click h2': 'makeNameEditable', 'blur input': 'saveChanges', 'keyup input': 'keyboardSaveChanges'},
  template: _.template($('#tmpl_person').html()),

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
  },

  render: function() {
    this.$el.html(this.template({person: this.model}));
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

  keyboardSaveChanges: function(ev) {
    if (13 == ev.keyCode) {
      this.saveChanges(ev);
    } else if (27 == ev.keyCode) {
      this.render();
    }
  },

  saveChanges: function(ev) {
    var $target = $(ev.currentTarget);
    var newName = $target.val();
    this.model.set('name', newName);
    this.model.save();
    this.render();
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
  }
});


People.Views.PersonCreationView= Backbone.View.extend({
  el: '#container',
  events: {'submit form': 'createNewPerson'},
  template: _.template($('#tmpl_newperson').html()),

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  createNewPerson: function(ev) {
    ev.preventDefault();
    var name = $('input[name="name"]').val();
    var email = $('textarea[name="email"]').val();
    var person = new People.Models.Person({name: name, email: email});
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
  People.allPeople.fetch({ success: People.router.showIndex });
  Backbone.history.start();
};


$(People.setup);

