var Planets = Planets || {
  Models: {},
  Views: {},
  Collections:{},
  Routers: {},
  setup: function() {}
}

Planets.Models.Planet = Backbone.Model.extend({});

Planets.Collections.PlanetCollection = Backbone.Collection.extend({
  model: Planets.Models.Planet,
  url: '/planets'
})


Planets.Views.PlanetView = Backbone.View.extend({
 tagName: 'div',
 template: _.template($('#tmpl_planet').html()),
 events: {
  'click a': 'deletePlanet',
  'dblclick': 'editPlanet'  
    },

 render: function() {
  this.$el.html(this.template({planet: this.model}));
  return this
 },

 deletePlanet: function(ev) {
  ev.preventDefault();
  this.model.destroy();
  new Planets.Views.PlanetCollectionView({collection: Planets.allPlanets}).render();
 },

 editPlanet: function(ev) {
  var that = this
    _.each(this.$('p'), function(el, i){
    // $.each(this.$('p'), function(i, el) {
      // console.log(i.text())
       console.log(i)
       console.log($(el).text())
       // console.log(i)
       // console.log(list)
       // console.log(el.text);
      var p_value = $(el).text();
      var newInput = $('<input>').val(p_value);
      $(el).replaceWith(newInput);
   });
  }

})

Planets.Views.PlanetCollectionView = Backbone.View.extend({
  el: '#container',

  render: function() {
    var that = this;
    this.$el.empty();
    this.collection.each(function(planetModel){
      var planetView = new Planets.Views.PlanetView({model: planetModel});
      that.$el.append(planetView.render().el);
    });
    this.totalmoons();
    return this;
  },

  totalmoons: function() {
    console.log("test");
    var total_moons = this.collection.pluck("moons")
    $('#total_moons').html("total_moons:" + total_moons)
  }
})

Planets.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": 'showIndex',
    "new": 'newPlanet',
  },
  showIndex: function() {
    var collectionView = new Planets.Views.PlanetCollectionView({ collection: Planets.allPlanets });
    collectionView.render();
  },

  newPlanet: function() {
    var newplanetView = new Planets.Views.PlanetCreateView()
    newplanetView.render();
  },

})

Planets.Views.PlanetCreateView = Backbone.View.extend({
  el: '#container',
  template: _.template($('#tmpl_newplanet').html()),
  events: {
    'submit form': 'createPlanet'
  },
  render: function() {
    this.$el.empty();
    this.$el.html(this.template());
  },

  createPlanet: function(ev) {
    ev.preventDefault();
    var name = $("input[name='name']").val();
    var size = $("input[name='size']").val();
    var moons = $("input[name='moons']").val();
    var dist_from_sun = $("input[name='dist_from_sun']").val();
    var planet = new Planets.Models.Planet({name: name, size: size, moons: moons, dist_from_sun:dist_from_sun})
    Planets.allPlanets.add(planet);
    planet.save();
    Planets.router.navigate("", {trigger: true});
  }

})

Planets.setup = function () {
  Planets.router = new Planets.Routers.AppRouter();
  Planets.allPlanets = new Planets.Collections.PlanetCollection();
  Planets.allPlanets.fetch({
    success: Planets.router.showIndex
  });
  Backbone.history.start();
}

$(Planets.setup);