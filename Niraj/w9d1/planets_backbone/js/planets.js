var planetApp = planetApp || {
  models: {},
  views: {},
  collections: {},
};

planetApp.models.Planet = Backbone.Model.extend({
  defaults: {
    name: "",
    moons: "",
    gravity: "",
    picture: "http://www.ipad-wallpapers.us/bgs/universe.jpg",
  }
});

planetApp.collections.PlanetCollection = Backbone.Collection.extend({
  model: planetApp.models.Planet
});

planetApp.views.PlanetView = Backbone.View.extend({
  tagName: 'li',
  events: { 'click .remove': 'remove'},

  remove: function() {
    this.model.destroy();
  },

  render: function() {
    var templateContents = $('#tmpl_planet').html();
    var template = _.template(templateContents);
    this.$el.html(template({planet: this.model}));
    return this;
  }
});

planetApp.views.PlanetCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#add_planet': 'addPlanetFromEvent'},

  initialize: function() {
    this.collection = new planetApp.collections.PlanetCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  add: function(name, moons, gravity, picture) {
    var planet = new planetApp.models.Planet({name: name, moons: moons, gravity: gravity, picture: picture});
    this.collection.add(planet);
  },

  addPlanetFromEvent: function(ev) {
    ev.preventDefault();
    var $name = $('#name');
    var $moons = $('#moons');
    var $gravity = $('#gravity');
    var $picture = $('#picture');
    this.add($name.val(), $moons.val(), $gravity.val(), $picture.val());
    $name.val('');
    $moons.val('');
    $gravity.val('');
    $picture.val('');
  },

  render: function() {
    $('#demo_planets').empty();
    this.collection.each(function(el) {
      var planetView = new planetApp.views.PlanetView({model: el});
      $('#demo_planets').append(planetView.render().el);
    });
  }
});

planetApp.setup = function() {
  var planet = new planetApp.views.PlanetCollectionView();
  planet.add('Earth', '1', '8.2', 'http://images.wisegeek.com/planet-earth.jpg');
};

$(planetApp.setup)

