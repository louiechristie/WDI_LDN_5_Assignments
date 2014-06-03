var Planets = Planets || {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  setup: function() {}
};

Planets.Models.Planet = Backbone.Model.extend({});
Planets.Collections.PlanetCollection = Backbone.Collection.extend({
  model: Planets.Models.Planet,
  url: '/planets'
});

// Show a single planet.
Planets.Views.PlanetView = Backbone.View.extend({
  tagName: 'li',
  events: {'click .close': 'remove',
          'click h2': 'makeNameEditable',
          'blur input': 'saveChanges',
          'keyup input': 'keyboardSaveChanges'}, 
  template: _.template($('#tmpl_planet').html()),

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
  },

  remove: function() {
        this.model.destroy();
    },

  render: function() {
    this.$el.html(this.template({planet: this.model}));
    return this;
  },

  makeNameEditable: function(ev) {
    var $target = $(ev.currentTarget);
    var name = $target.text();
    var newInput = $('<input>');
    newInput.val(name);
    $target.replaceWith(newInput);
    newInput.focus();
  },

  keyboardSaveChanges: function(ev) {
    if (13 == ev.keyCode) {
      this.saveChanges(ev);
    } else if (27 == ev.keyCode) {
      this.render();
    }
  },

  saveChanges: function(ev) {
    var $target = $(ev.currentTarget);
    var newName = $target.val();
    var newEmail = $target.val();
    this.model.set('name', newName);
    this.model.set('email', newEmail)
    this.model.save();
  }
});

// Show all planets.
Planets.Views.PlanetCollectionView = Backbone.View.extend({
  el: '#container',

  render: function() {
    var that = this;
    this.$el.empty();
    this.collection.each(function(planetModel){
      var planetView = new Planets.Views.PlanetView({model: planetModel});
      that.$el.append(planetView.render().el);
    });
    return this;
  },

  initialize: function() {
      this.collection.bind('remove', this.render, this);
    },
});

// Show form for a new planet.
Planets.Views.PlanetCreationView = Backbone.View.extend({
  el: '#container',
  events: {'submit form': 'createNewPlanet'},
  template: _.template($('#tmpl_newplanet').html()),

  render: function() {
    this.$el.html(this.template());
    return this;
  },

  createNewPlanet: function(ev) {
    ev.preventDefault();
    var name = $('input[name="name"]').val();
    var mass = $('input[name="mass"]').val();
    var moons = $('select[name="moons"]').val();
    var image = $('input[name="image"]').val();
    var planet = new Planets.Models.Planet({name: name, mass: mass, moons: moons, image: image, });
    Planets.allPlanets.add(planet);
    planet.save();
    Planets.router.navigate("", {trigger: true});
  }
});

Planets.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "showIndex",
    "new": "createNewPlanet"
  },

  showIndex: function() {
    var collectionView = new Planets.Views.PlanetCollectionView({collection: Planets.allPlanets});
    collectionView.render();
  },

  createNewPlanet: function() {
    new Planets.Views.PlanetCreationView().render();
  }
});

Planets.setup = function() {
  Planets.router = new Planets.Routers.AppRouter();
  Planets.allPlanets = new Planets.Collections.PlanetCollection();
  Planets.allPlanets.fetch({ success: Planets.router.showIndex });
  Backbone.history.start();

}

$(Planets.setup);

