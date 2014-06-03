var planetsApp = planetsApp || {
  models: {},
  views: {},
  collections: {}
};

planetsApp.models.Planet = Backbone.Model.extend({
  defaults: {
    name: "",
    url: "",
    numberofmoons: "",
    gravityratio: ""
  }
});

planetsApp.collections.PlanetCollection = Backbone.Collection.extend({
  model: planetsApp.models.Planet
});

planetsApp.views.PlanetView = Backbone.View.extend({
  tagName: 'li',
  events: {'click .remove': 'remove'},

  remove: function(){
    this.model.destroy();
  },

  render: function(){
    var templateContents = $('#tmpl_planet').html();
    var template = _.template(templateContents);
    this.$el.html(template({
      planet: this.model
    }));
    return this;
  }
});

planetsApp.views.PlanetCollectionView = Backbone.View.extend({
  el: '#planet_containers',
  events: {'submit form#add_planet': 'addPlanetFromEvent'},

  initialize: function(){
    this.collection = new planetsApp.collections.PlanetCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  add: function(name, url, numberofmoons, gravityratio){
    var planet = new planetsApp.models.Planet({name: name, url: url, numberofmoons: numberofmoons, gravityratio: gravityratio});
    this.collection.add(planet)
  },

addPlanetFromEvent: function(ev){
  ev.preventDefault();
  var $name = $('#name');
  var $url = $('#url');
  var $numberofmoons = $('#numberofmoons');
  var $gravityratio = $('#gravityratio');

  this.add($name.val(), $url.val(), $numberofmoons.val(), $gravityratio.val());

  $name.val('');
  $url.val('');
  $numberofmoons.val('');
  $gravityratio.val('');
},

render: function(){
  $('#show_planets').empty();
  this.collection.each(
    function(el){
    var planetView = new planetsApp.views.PlanetView({
      model: el
    });

    $('#show_planets').append(planetView.render().el);
  });
}

});


planetsApp.setup = function(){
var planets = new planetsApp.views.PlanetCollectionView();
planets.add('Mercury', 'http://upload.wikimedia.org/wikipedia/commons/3/30/Mercury_in_color_-_Prockter07_centered.jpg', '0', '0.378');
};

$(planetsApp.setup);