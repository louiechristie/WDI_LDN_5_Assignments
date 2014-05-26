// defining the module:
var addressApp = addressApp || {
  models: {},
  views: {},
  collections: {}
};

addressApp.models.Planet = Backbone.Model.extend({
  defaults: {
    name: "",
    volume: "",
    url: ""
   }
});

addressApp.collections.PlanetCollection = Backbone.Collection.extend({
  model: addressApp.models.Planet
});

addressApp.views.PlanetView = Backbone.View.extend({
  tagName: 'li',
  events: {'click .close': 'remove'},

  remove: function () {
    this.model.destroy();
  },

  render: function() {
    var templateContents = $('#tmpl_planet').html();
    var template = _.template(templateContents);
    this.$el.html(template({planet: this.model}));
    return this;
  }
});

addressApp.views.PlanetCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#add_planet': 'addPlanetFromEvent'},

  initialize: function() {
    this.collection = new addressApp.collections.PlanetCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  // add an planet to this view's Collection:
  add: function(name, volume, url) {
        var planet = new addressApp.models.Planet({name: name, volume: volume, url: url});
        this.collection.add(planet);
  },

  // Add and image from a form to submit event.
  addPlanetFromEvent: function(ev) {
    ev.preventDefault();
    console.log('addPlanetFromEvent')
    var $name = $('#name');
    var $volume = $('#volume');
    var $url = $('#url');
    this.add($name.val(), $volume.val(), $url.val());
    $name.val('');
    $volume.val('');
    $url.val('');
  },

  // draw a planet on the page:
  render: function() {
    var that = this;
    $('#address_book').empty();
    this.collection.each(function(el) {
      var planetView = new addressApp.views.PlanetView({model: el});
      $('#address_book').append(planetView.render().el);
    });

  }

});


// creating a new view:
addressApp.setup = function() {
  var address = new addressApp.views.PlanetCollectionView();

  address.add('Jupiter', '1321.3', 'http://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Jupiter_by_Cassini-Huygens.jpg/390px-Jupiter_by_Cassini-Huygens.jpg');
  address.add('Noor BL', 'noorbl@hello.com', 'http://www.fillmurray.com/210/310');
  address.add('Nic Cage', 'cage@hello.com', 'http://www.placecage.com/g/200/300');
};


$(addressApp.setup);