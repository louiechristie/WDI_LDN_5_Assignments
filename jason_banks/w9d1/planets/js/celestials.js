var celestialsApp = celestialsApp || {
  models: {},
  views: {},
  collections: {}
}

celestialsApp.models.Body = Backbone.Model.extend({
  defaults: {
    body_type: 'Planet',
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

celestialsApp.collections.BodyCollection = Backbone.Collection.extend({
  model: celestialsApp.models.Body
});

celestialsApp.view.PlanetView = Backbone.View.extend({
  tagName: 'li',
  render: function() {
    var templateContents = $('#template_planet').html();
    var template = _.template(templateContents);
    this.$el.html(template({planet: this.model}));
    return this;
  }
})

celestialsApp.view.StarView = Backbone.View.extend({
  tagName: 'li',
  render: function() {
    var templateContents = $('#template_star').html();
    var template = _.template(templateContents);
    this.$el.html(template({star: this.model}));
    return this;
  }
})

celestialsApp.view.BodyCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#celestial_body': 'addBodyFromForm'},
  initialize: function() {
    console.log('Initializing!');
    this.collection = new celestialsApp.collection.BodyCollection();
    this.collection.bind('addPlanet', this.render, this);
    this.collection.bind('addStar', this.render, this);
  },

  addPlanet: function(body_type, name, galaxy, mass, star, moons, age) {
    var planet = new celestialsApp.model.Body ({body_type: body_type, name: name, galaxy: galaxy, mass: mass, star: star, moons: moons, age: age });
    this.collection.add(planet);
  },

  addStar: function(body_type, name, galaxy, mass, classification, luminosity, color, age) {
    var star = new celestialsApp.model.Body ({body_type: body_type, name: name, galaxy: galaxy, mass: mass, classification: classification, luminosity: luminosity, color: color, age: age });
    this.collection.add(star);
  },

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
      this.addPlanet($body_type.val(), $name.val(), $galaxy.val(), $mass.val(), $star.val(), $moons.val(), $age.val());
    } else {
      this.addStar($body_type.val(), $name.val(), $galaxy.val(), $mass.val(), $classification.val(), $luminosity.val(), $color.val(), $age.val());
    }
    $body_type.val('');
    $name.val('');
    $galaxy.val('');
    $mass.val('');
    $age.val('');
    $star('');
    $moons('');
    $classification('');
    $luminosity('');
    $color('');
  },

  render: function(){
    $('#bodies').empty();
    this.collection.each(function(el){
      bodyView = new celestialsApp.views.PlanetView({model: planet})
      $('#bodies').append(bodyView.render().el);
    });
  }
});

// var addressApp = addressApp || {
//   models: {},
//   views: {},
//   collections: {}
// };

// addressApp.models.Address = Backbone.Model.extend({
//     defaults: {
//       first_name: '',
//       last_name: '',
//       email: '',
//       image: '',
//     }
// });

// addressApp.collections.AddressCollection = Backbone.Collection.extend({
//   model: addressApp.models.Address
// });

// addressApp.views.AddressView = Backbone.View.extend({
//   tagName: 'li',
//   events: {'click span': 'remove'},
//   remove: function() {
//     this.model.destroy();
//   },
//   render: function(){
//     var templateContents = $('#tmpl_address').html();
//     var template = _.template(templateContents);
//     this.$el.html(template({address: this.model}));
//     return this;
//   }
// })

// addressApp.views.AddressCollectionView = Backbone.View.extend({
//   el: '#container',
//   events: {'submit form#address_form': 'addAddressFromForm'},

//   initialize: function() {
//     console.log("This is the initializing function.");
//     this.collection = new addressApp.collections.AddressCollection();
//     this.collection.bind('add', this.render, this);
//     this.collection.bind('remove', this.render, this);
//   },

  // add: function(first_name, last_name, email, image){
  //   var address = new addressApp.models.Address({first_name: first_name, last_name: last_name, email: email, image: image});
  //   this.collection.add(address);
  // },

  // addAddressFromForm: function(ev) {
  //   ev.preventDefault();
  //   var $first_name = $('#first_name');
  //   var $last_name = $('#last_name');
  //   var $email = $('#email');
  //   var $image = $('#image');
  //   this.add($first_name.val(), $last_name.val(), $email.val(), $image.val());
  //   $first_name.val('');
  //   $last_name.val('');
  //   $email.val('');
  //   $image.val('');
  // },

//   render: function(){
//     $('#address_container').empty();
//     this.collection.each(function(el){
//       var addressView = new addressApp.views.AddressView({ model: el});
//       $('#address_container').append(addressView.render().el);
//     });
//   }
// })

addressApp.setup = function() {
  var addressBook = new addressApp.views.AddressCollectionView();
  addressBook.add('Steve', 'Zissou', 'szissou@lifeqauatic.com', 'http://37.media.tumblr.com/3f521ec4df88886a92a26a0895c03d28/tumblr_n38som3Ljz1s7aky5o1_1280.jpg');
  addressBook.add('Mary', 'Tyler Moore', 'mtylermoore@tvland.com', 'http://37.media.tumblr.com/77ea19355786597f3f967c72f8ba0c6d/tumblr_n09td4gc9Q1s7aky5o1_1280.jpg');
}

$(addressApp.setup);