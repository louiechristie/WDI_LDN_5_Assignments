// defining the module:
var addressApp = addressApp || {
  models: {},
  views: {},
  collections: {}
};

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
  events: {'click .close': 'remove'},

  remove: function () {
    this.model.destroy();
  },

  render: function() {
    var templateContents = $('#tmpl_person').html();
    var template = _.template(templateContents);
    this.$el.html(template({person: this.model}));
    return this;
  }
});

addressApp.views.PersonCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#add_person': 'addPersonFromEvent'},

  initialize: function() {
    this.collection = new addressApp.collections.PersonCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  // add an person to this view's Collection:
  add: function(name, email, url) {
        var person = new addressApp.models.Person({name: name, email: email, url: url});
        this.collection.add(person);
  },

  // Add and image from a form to submit event.
  addPersonFromEvent: function(ev) {
    ev.preventDefault();
    console.log('addPersonFromEvent')
    var $name = $('#name');
    var $email = $('#email');
    var $url = $('#url');
    this.add($name.val(), $email.val(), $url.val());
    $name.val('');
    $email.val('');
    $url.val('');
  },

  // draw a person on the page:
  render: function() {
    var that = this;
    $('#address_book').empty();
    this.collection.each(function(el) {
      var personView = new addressApp.views.PersonView({model: el});
      $('#address_book').append(personView.render().el);
    });

  }

});


// creating a new view:
addressApp.setup = function() {
  var address = new addressApp.views.PersonCollectionView();

  address.add('Louie Christie', 'louiechristie@hello.com', 'http://www.fillmurray.com/200/300');
  address.add('Noor BL', 'noorbl@hello.com', 'http://www.fillmurray.com/210/310');
  address.add('Nic Cage', 'cage@hello.com', 'http://www.placecage.com/g/200/300');
};


$(addressApp.setup);