var universeApp = universeApp || {
  models: {},
  views: {},
  collections: {}
}

universeApp.models.Planet = Backbone.Model.extend({
  defaults: {
    name: "",
    moons: "",
    size: "",
    dist_to_sun: ""
  }
})

universeApp.models.Star = Backbone.Model.extend({
  defaults: {
    name: "",
    stage: "",
    nos_planets: "'"
  }
})

universeApp.collections.PlanetCollection = Backbone.Collection.extend({
  model: universeApp.models.Planet,

  comparator: function(planet) {
      return planet.get("dist_to_sun");
    }
})


universeApp.collections.StarCollection = Backbone.Collection.extend({
  model: universeApp.models.Star
})

universeApp.views.PlanetView = Backbone.View.extend({
  tagname: 'li',

  render: function() {
    var templateContents = $('#templ_planet').html();
    var template = _.template(templateContents);
    this.$el.html(template({planet: this.model}));
    return this;
  }
})

universeApp.views.StarView = Backbone.View.extend({
  tagname: 'li',

  render: function() {
    var templateContents = $('#templ_star').html();
    var template = _.template(templateContents);
    this.$el.html(template({star: this.model}));
    return this;
  }
})


universeApp.views.PlanetCollectionView = Backbone.View.extend({
  el: '#container',

  events: {'submit form#planet_add': 'addPlanet'},

  initialize: function() {
    this.collection = new universeApp.collections.PlanetCollection();
    this.collection.bind('add', this.rewrite, this)
  },

  add: function(name, moons, size, dist_to_sun) {
    var planet = new universeApp.models.Planet({name: name, size: size, moons: moons, dist_to_sun: dist_to_sun});
    this.collection.add(planet);
  },
  appendItem: function(planet) {
    var planetView = new universeApp.views.PlanetView({model: planet});
    $('#solarsystem').append(planetView.render().el);
  },
  rewrite: function(){
    $('#solarsystem').html('');
    this.collection.sort();
    this.collection.each(function(planet) {
        var planetView = new universeApp.views.PlanetView({model: planet});
        $('#solarsystem').append(planetView.render().el);    
    })
  },

  addPlanet: function(ev) {
    ev.preventDefault();
    var name = $('#name').val();
    var moons = $('#moons').val();
    var size = $('#size').val();
    var dist_to_sun = $('#dist_to_sun').val();
    this.add(name, moons, size, dist_to_sun);
  }
  
})

universeApp.views.StarCollectionView = Backbone.View.extend({
  el: '#container2',

  initialize: function() {
    this.collection = new universeApp.collections.StarCollection();
    this.collection.bind('add', this.appendItem, this)
  },

  add: function(name, stage, nos_planets) {
    var star = new universeApp.models.Star({name: name, stage: stage, nos_planets: nos_planets});
    this.collection.add(star);
  },
  appendItem: function(star) {
    var starView = new universeApp.views.StarView({model: star});
    $('#galaxy').append(starView.render().el);
  }
  
})


universeApp.setup = function () {
  var SolarSystem = new universeApp.views.PlanetCollectionView();

  

  SolarSystem.add("earth",1,1,1);
  SolarSystem.add("mars", 0.5,3,2);  

  var Galaxy = new universeApp.views.StarCollectionView();
  Galaxy.add("The Sun","white dwarf", 5);
  Galaxy.add("Alpha x","Yellow dandelion",7);  
};

$(universeApp.setup);

