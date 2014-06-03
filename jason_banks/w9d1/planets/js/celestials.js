var celestialsApp = celestialsApp || {
  models: {},
  views: {},
  collections: {}
}

celestialsApp.models.Body = Backbone.Model.extend({
  defaults: {
    body_type: '',
    name: '',
    galaxy: '',
    mass: '',
    age: ''
  }
});

celestialsApp.models.PlanetBody = celestialsApp.models.Body.extend({
  defaults: {
    star: '',
    moons: '',
  }
})

celestialsApp.models.StarBody = celestialsApp.models.Body.extend({
  defaults: {
    classification: '',
    luminosity: '',
    color: '',
  }
})

celestialsApp.collections.PlanetCollection = Backbone.Collection.extend({
  model: celestialsApp.models.Planet
});

celestialsApp.collections.StarCollection = Backbone.Collection.extend({
  model: celestialsApp.models.Star
});

celestialsApp.views.PlanetView = Backbone.View.extend({
  tagName: 'li',
  render: function() {
    console.log('At the planet render!');
    var templateContents = $('#template_planet').html();
    console.log(templateContents);
    var template = _.template(templateContents);
    console.log(this);    
    this.$el.html(template({planet: this.model}));
    return this;
  }
})

celestialsApp.views.StarView = Backbone.View.extend({
  tagName: 'li',
  render: function() {
    var templateContents = $('#template_star').html();
    var template = _.template(templateContents);
    this.$el.html(template({star: this.model}));
    return this;
  }
})

celestialsApp.views.PlanetCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#celestial_body': 'addBodyFromForm'},
  initialize: function() {
    console.log('Initializing!');
    this.collection = new celestialsApp.collections.PlanetCollection();
    this.collection.bind('add', this.render, this);
  },

  add: function(body_type, name, galaxy, mass, age, star, moons) {
    var planet = new celestialsApp.models.PlanetBody ({body_type: body_type, name: name, galaxy: galaxy, mass: mass, age: age, star: star, moons: moons});
    this.collection.add(planet);
  },

  // addStar: function(body_type, name, galaxy, mass, age, classification, luminosity, color) {
  //   var star = new celestialsApp.models.StarBody ({body_type: body_type, name: name, galaxy: galaxy, mass: mass, age: age , classification: classification, luminosity: luminosity, color: color});
  //   this.collection.add(star);
  // },

  addBodyFromForm: function(ev){
    ev.preventDefault();
    var $body_type = $('#body_type');
    var $name = $('#name');
    var $galaxy = $('#galaxy');
    var $mass = $('#mass');
    var $age = $('#age');
    var $star = $('#star');
    var $moons = $('#moons');
    var $classification = $('#classification');
    var $luminosity = $('#luminosity');
    var $color = $('#color');
    if($body_type.val() === 'planet'){
      this.addPlanet($body_type.val(), $name.val(), $galaxy.val(), $mass.val(), $age.val(), $star.val(), $moons.val());
    } else {
      this.addStar($body_type.val(), $name.val(), $galaxy.val(), $mass.val(), $age.val(), $classification.val(), $luminosity.val(), $color.val());
    }
    $body_type.val('');
    $name.val('');
    $galaxy.val('');
    $mass.val('');
    $age.val('');
    $star.val('');
    $moons.val('');
    $classification.val('');
    $luminosity.val('');
    $color.val('');
  },

  render: function(){
    console.log('At the collection render!');
    $('#bodies').empty();
    this.collection.each(function(el){
      planetView = new celestialsApp.views.PlanetView({model: planet})
      $('#bodies').append(planetView.render().el);
    });
  },

  // renderStar: function(){
  //   $('#bodies').empty();
  //   this.collection.each(function(el){
  //     starView = new celestialsApp.views.StarView({model: star})
  //     $('#bodies').append(starView.render().el);
  //   });
  // }
});

celestialsApp.setup = function() {
  var planets = new celestialsApp.views.PlanetCollectionView();
  planets.add('Planet', 'Earth', 'Milky Way', '5.97219 × 10^24 kg', '4.54 +/- 0.05 billion years', 'The Sun', '1');
}

$(celestialsApp.setup);