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

Planets.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": showIndex,
    "new": newPlanet,
  },

  showIndex: function() {},

  newPlanet: function() {},

})


Planets.setup = function () {
  var planetsRouter = new Planets.Routers.AppRouter();
  


  Backbone.history.start();


}