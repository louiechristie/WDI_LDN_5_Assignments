// defining the module:
var addressApp = addressApp || {
  models: {},
  views: {},
  collections: {}
};


addressApp.views.AppView = Backbone.View.extend({
  initialize: function() {
    this.render();
  }
});


addressApp.models.Person = Backbone.Model.extend({
  defaults: {
    name: "",
    email: "",
    url: ""
   }
});





addressApp.collections.PersonCollection = Backbone.Collection.extend({
  model: addressApp.models.Person
});


addressApp.views.PersonView = Backbone.View.extend({
  tagName: 'li',
  render: function() {
    var templateContents = $('#tmpl_person').html();
    var template = _.template(templateContents);
    this.$el.html(template({person: this.model}));
    return this;
  }
});



addressApp.views.PersonCollectionView = Backbone.View.extend({
  el: '#demo_people',

  initialize: function() {
    this.collection = new addressApp.collections.PersonCollection();
    this.collection.bind('add', this.appendItem, this);
  },

  // add an image to this view's Collection:
  add: function(title, email, url) {
        var person = new addressApp.models.Person({name: name, email: email, url: url});
        this.collection.add(person);
  },

  // draw an image on the page:
  appendItem: function(person) {
    var personView = new addressApp.views.PersonView({model: person});
    this.$el.append(personView.render().el);
  }

});


// creating a new view:
addressApp.setup = function() {
  var avocado = new addressApp.views.AppView();

  var address = new addressApp.views.PersonCollectionView();
  address.add('Louie Christie', 'louiechristie@hello.com', 'http://www.fillmurray.com/200/300');
  address.add('Noor BL', 'noorbl@hello.com', 'http://www.fillmurray.com/210/310');
  address.add('Nic Cage', 'cage@hello.com', 'http://www.placecage.com/g/200/300');
};


$(addressApp.setup);