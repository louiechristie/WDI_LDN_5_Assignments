 // defining the module:
var planetApp = planetApp || {
  models: {},
  views: {},
  collections: {}
};


planetApp.models.Planet = Backbone.Model.extend({
  defaults: {
    name: "",
    moons: "",
    gravity: "",
    url: ""
   }
});



planetApp.collections.PlanetCollection = Backbone.Collection.extend({
  model: planetApp.models.Planet
});


planetApp.views.PlanetView = Backbone.View.extend({
  tagName: 'li',
  events: { 'click .close': 'remove'},

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

  // add an image to this view's Collection:
  add: function(name, moons, gravity, url) {
        var planet = new planetApp.models.Planet({name: name, moons: moons, gravity: gravity, url: url});
        this.collection.add(planet);
  },

   addPlanetFromEvent: function(ev) {
    ev.preventDefault();
    var $name = $('#name');
    var $moons = $('#moons')
    var $gravity = $('#gravity')
    var $url = $('#url');
    this.add($name.val(), $moons.val(), $gravity.val(), $url.val());
    $name.val('');
    $moons.val('');
    $gravity.val('');
    $url.val('');
  },

  render: function() {
    $('#list_planet').empty();
    this.collection.each(function(el) {
      var planetView = new planetApp.views.PlanetView({model: el});
      $('#list_planet').append(planetView.render().el);
    });
  }

});


// creating a new view:
planetApp.setup = function() {
  
  var planet = new planetApp.views.PlanetCollectionView();
  planet.add('Mars', 'http://www.fillmurray.com/200/300');
  planet.add('Earth', 'http://www.fillmurray.com/210/310');
  planet.add('Venus', 'http://www.placecage.com/g/200/300');
};


$(planetApp.setup);