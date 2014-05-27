// defining the module:
var planetsApp = planetsApp || {
  models: {},
  views: {},
  collections: {}
};

planetsApp.models.Planet = Backbone.Model.extend({
  defaults: {
    name: "",
    volume: "",
    url: ""
   }
});

planetsApp.collections.PlanetCollection = Backbone.Collection.extend({
  model: planetsApp.models.Planet
});

planetsApp.views.PlanetView = Backbone.View.extend({
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

planetsApp.views.PlanetCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#add_planet': 'addPlanetFromEvent'},

  initialize: function() {
    this.collection = new planetsApp.collections.PlanetCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  // add an planet to this view's Collection:
  add: function(name, volume, url) {
        var planet = new planetsApp.models.Planet({name: name, volume: volume, url: url});
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
    $('#solar_system').empty();
    this.collection.each(function(el) {
      var planetView = new planetsApp.views.PlanetView({model: el});
      $('#solar_system').append(planetView.render().el);
    });

  }

});


// creating a new view:
planetsApp.setup = function() {
  var planets = new planetsApp.views.PlanetCollectionView();

  planets.add('Mercury', '0.056', 'http://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Mercury_in_color_-_Prockter07_centered.jpg/405px-Mercury_in_color_-_Prockter07_centered.jpg');
  planets.add('Earth', '1', 'http://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Earth_Eastern_Hemisphere.jpg/450px-Earth_Eastern_Hemisphere.jpg');
  planets.add('Venus', '0.866', 'http://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Venus_globe.jpg/375px-Venus_globe.jpg');
  planets.add('Jupiter', '1321.3', 'http://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Jupiter_by_Cassini-Huygens.jpg/390px-Jupiter_by_Cassini-Huygens.jpg');
};


$(planetsApp.setup);