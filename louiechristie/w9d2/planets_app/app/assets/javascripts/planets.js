// defining the module:
var planetsApp = planetsApp || {
  models: {},
  views: {},
  routers: {},
  collections: {},
  setup: function () {}
};

// Planet model
planetsApp.models.Planet = Backbone.Model.extend({
  defaults: {
    name: "",
    volume: "",
    url: ""
   }
});

// Planet Collection
planetsApp.collections.PlanetCollection = Backbone.Collection.extend({
  model: planetsApp.models.Planet,
  url: '/planets'
});

// Planet view
planetsApp.views.PlanetView = Backbone.View.extend({
  tagName: 'li',
  events: {'click .close': 'remove'},
  template: _.template($('#tmpl_planet').html()),

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.collection = new planetsApp.collections.PlanetCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  render: function() {
    this.$el.html(this.template({planet: this.model}));
    return this;
  },

  remove: function () {
    this.model.destroy();
    this.$el.remove();
  }
});

// PlanetCollection View
planetsApp.views.PlanetCollectionView = Backbone.View.extend({
  el: '#container',

  render: function() {
    var that = this;
    this.$el.empty();
    this.collection.each(function(planetModel) {
      var planetView = new planetsApp.views.PlanetView({model: planetModel});
      that.$el.append(planetView.render().el);
    })
    return this;
  },

  events: {'submit form#add_planet': 'addPlanetFromEvent'},

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

planetsApp.routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "showIndex",
  },

  showIndex: function() {
    var collectionView = new planetsApp.views.PlanetCollectionView({
        collection: planetsApp.allPlanets
      });
    collectionView.render();
  },

})



// creating a new view:
planetsApp.setup = function() {
  planetsApp.router = new planetsApp.routers.AppRouter();
  planetsApp.allPlanets = new planetsApp.collections.PlanetCollection();
  planetsApp.allPlanets.fetch({ success: planetsApp.router.showIndex });
  Backbone.history.start(); 
};

console.log('planets.js')
$(planetsApp.setup);