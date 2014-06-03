var planetApp = planetApp || {
  models: {},
  views: {},
  collections: {}
};

planetApp.models.Planet = Backbone.Model.extend({
  defaults: {
    name: "",
    moons: "",
    mass: "",
    image: ""
  }
});

planetApp.collections.PlanetCollection = Backbone.Collection.extend({
  model: planetApp.models.Planet
});

planetApp.views.PlanetView = Backbone.View.extend({
  tagName: 'li',

  events: {'click .close' : 'remove'},

  remove: function() {
    this.model.destroy();
  },

  render: function() {
    var templateContents = $('#tmpl_planet').html();
    var template = _.template(templateContents);
    this.$el.html(template({planet: this.model}));
    return this;
  }
})

planetApp.views.PlanetCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#add_planet': 'addPlanetFromEvent'},

  initialize: function() {
    console.log("SUCCESS!");
    this.collection = new planetApp.collections.PlanetCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  // Add an address to this views collections
    add: function(name, moons, mass, image) {
      var planet = new planetApp.models.Planet({name: name, moons: moons, mass: mass, image: image});
      this.collection.add(planet);
    },

     // add an image from form submission
    addPlanetFromEvent: function(ev) {
      ev.preventDefault();
      var $name = $('#name');
      var $moons = $('#moons');
      var $mass = $('#mass');
      var $url = $('#url');
      this.add($name.val(), $moons.val(), $mass.val(), $url.val());
      $name.val('');
      $moons.val('');
      $mass.val('');
      $url.val('');
    },

    // Draw an address on the page
    render: function() {
      $('#planet_container').empty();
      this.collection.each(function(el) {
        var planetView = new planetApp.views.PlanetView({model: el});
        $('#planet_container').append(planetView.render().el);
      });
    }

});

planetApp.setup = function() {

  var newPlanet = new planetApp.views.PlanetCollectionView();
  newPlanet.add('Earth', '1', '100kg', 'http://1.bp.blogspot.com/-dVz_71071d4/Ubp6rVJtJvI/AAAAAAAA6DU/-5I0LPsyL5s/s1600/1.jpg');
  newPlanet.add('Mercury', '5', '600kg', 'http://www.utahpeoplespost.com/wp-content/uploads/2014/03/mercury_4179_1.jpg');
  newPlanet.add('Jupiter', '72', '1000kg', 'http://upload.wikimedia.org/wikipedia/commons/e/e2/Jupiter.jpg');
  newPlanet.add('Mars', '5', '340kg', 'http://static.giantbomb.com/uploads/scale_small/0/4866/192066-mars.jpg');
  newPlanet.add('Venus', '8', '58kg', 'http://upload.wikimedia.org/wikipedia/commons/8/85/Venus_globe.jpg');
  newPlanet.add('Neptune', '3', '467kg', 'http://solarsystem.nasa.gov/multimedia/gallery/Neptune_Full.jpg');
  };

$(planetApp.setup);








