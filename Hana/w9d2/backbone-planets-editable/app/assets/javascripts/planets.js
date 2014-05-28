var planetsApp = planetsApp || {
  models: {},
  views: {},
  collections: {},
  routers: {},
  setup: function(){}
};

//Creates Planet model
planetsApp.models.Planet = Backbone.Model.extend({
});

//Creates Planet collection
planetsApp.collections.PlanetCollection = Backbone.Collection.extend({
  model: planetsApp.models.Planet,
  url: '/planets'
});

//Shows single planet
planetsApp.views.PlanetView = Backbone.View.extend({
  tagName: 'div',
  events: {'click .remove': 'remove', 'click h2': 'makeTextEditable', 'click .input': 'makeTextEditable'},
  template: _.template($('#tmpl_planet').html()),

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
  },

  render: function(){
    this.$el.html(this.template({planet: this.model
    }));
    return this;
  },

  remove: function(){
    this.model.destroy();
  },

  makeTextEditable: function(ev){
    var $target = $(ev.currentTarget);
    var content = $target.text();
    var newInput = $('<input>');
    newInput.val(content);
    $target.replaceWith(newInput);
    newInput.focus();
  },

  keyboardSaveChanges: function(ev){
    if (13 == ev.keyCode)
      this.saveChanges(ev);
    else if (27 == ev.keyCode)
      this.render();
  },

  saveChanges: function(ev){
    var $target = $(ev.currentTarget);
    var newHeadline = $target.val();
    this.model.set('title', newHeadline);
    this.model.save();
    this.render();
  }
});

//Shows all planets
planetsApp.views.PlanetCollectionView = Backbone.View.extend({
  el: '#planets_container',
 
  render: function(){
    var that = this;
    this.$el.empty();
    this.collection.each(function(planetModel){
      var planetView = new planetsApp.views.PlanetView({
        model: planetModel
      });
      that.$el.append(planetView.render().el);
    });
    return this;
  }
});

//Shows the form for a new planet
planetsApp.views.PlanetCreationView = Backbone.View.extend({
  el: "#planets_container",
  events: {'submit form': 'createNewPlanet'},
  template: _.template($('#tmpl_newplanet').html()),

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  createNewPlanet: function(ev){
    ev.preventDefault();
    var namev = $('input[name="name"').val();
    var urlv = $('input[name="url"').val();
    var moonsv = $('input[name="moons"').val();
    var diameterv = $('input[name="diameter"').val();
    var tempv = $('input[name="temp"').val();
    var planet = new planetsApp.models.Planet({name: namev, url: urlv, moons: moonsv, diameter: diameterv, temp: tempv});
    planetsApp.allPlanets.add(planet);
    planet.save();
    planetsApp.router.navigate("",{trigger: true});
  }
});

//Creating routes for planets
planetsApp.routers.AppRouter = Backbone.Router.extend({
  routes: {
    "":"showIndex",
    "new":"createNewPlanet"
  },
  showIndex: function(){
    var collectionView = new planetsApp.views.PlanetCollectionView({collection: planetsApp.allPlanets});
    collectionView.render();
  },
  createNewPlanet: function(){
    new planetsApp.views.PlanetCreationView().render();
  }
}) 

//Planets Setup
planetsApp.setup = function(){
  planetsApp.router = new planetsApp.routers.AppRouter();
  planetsApp.allPlanets = new planetsApp.collections.PlanetCollection();
  planetsApp.allPlanets.fetch({success: planetsApp.router.showIndex});
  Backbone.history.start();
};

$(planetsApp.setup);