var Planets = Planets || {
  Models: {},
  Views: {},
  Collections: {},
  Routers: {},
  setup: function() {}
};

Planets.Models.Planet = Backbone.Model.extend({});

Planets.Collections.PlanetCollection = Backbone.Collection.extend({
  model: Planets.Models.Planet,
  url: '/planets'
});

Planets.Views.PlanetView = Backbone.View.extend({
  tagName: 'div',
  className: 'planet',
  events: {'click span': 'makeElementEditable',
            'blur input': 'saveChanges',
            'keyup input': 'keyboardSaveChanges',
            'click button': 'remove',
  },
  template: _.template($('#template_planet').html()),

  render: function() {
    this.$el.html(this.template({planet: this.model}));
    return this;
  },

  makeElementEditable: function(ev) {
    var $target = $(ev.currentTarget);
    var elementText = $target.text();
    var newInput = $('<input>');
    newInput.val(elementText);
    $target.replaceWith(newInput);
    newInput.focus();
  },

  saveChanges: function(ev) {
    var $target = $(ev.currentTarget);
    var elementText = $target.val();
    var modelAttribute = $target.parent().attr('id');
    this.model.set(modelAttribute, elementText);
    this.model.save();
    this.render();
  },

  keyboardSaveChanges: function(ev) {
    if (13 == ev.keyCode) {
      this.saveChanges(ev);
    } else if (27 == ev.keyCode) {
      this.render();
    }
  },

  remove: function(ev) {
    this.model.destroy();
  }
});

Planets.Views.PlanetCollectionView = Backbone.View.extend({
  el: '#planets-container',
  render: function() {
    var that = this;
    this.$el.empty();
    this.collection.each(function(planetModel){
      var planetView = new Planets.Views.PlanetView({model: planetModel});
      that.$el.append(planetView.render().el);
    });
    return this;
  }
});

Planets.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    '': 'showIndex',
    'planet/new': 'createNewPlanet'
  },

  showIndex: function() {
    new Planets.Views.PlanetCollectionView({collection: Planets.allPlanets}).render();
  },

  createNewPlanet: function() {
    new Planets.Views.PlanetCreationView().render();
  }
});

Planets.Views.PlanetCreationView = Backbone.View.extend({
  el: '#planets-container',
  events: {'submit form#planet_form': 'createNewPlanet'},
  template: _.template($('#template_newplanet').html()),
  render: function() {
    this.$el.html(this.template());
    return this;
  },

  createNewPlanet: function(ev) {
    ev.preventDefault();
    var name = $('input[name="name"]').val();
    var age = $('input[name="age"]').val();
    var mass = $('input[name="mass"]').val();
    var moons = $('input[name="moons"]').val();
    var image = $('input[name="image"]').val();
    var newPlanet = new Planets.Models.Planet({name: name, age: age, mass: mass, moons: moons, image: image});
    Planets.allPlanets.add(newPlanet);
    newPlanet.save();
    Planets.router.navigate('', {trigger: true});
  }
});

Planets.setup = function() {
  Planets.router = new Planets.Routers.AppRouter();
  Planets.allPlanets = new Planets.Collections.PlanetCollection();
  Planets.allPlanets.fetch({ success: Planets.router.showIndex });
  Backbone.history.start();
};

$(Planets.setup);

