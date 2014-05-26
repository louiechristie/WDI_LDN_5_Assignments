// defining the module:
var starsApp = starsApp || {
  models: {},
  views: {},
  collections: {}
};

starsApp.models.Star = Backbone.Model.extend({
  defaults: {
    name: "",
    luminosity: "",
    url: ""
   }
});

starsApp.collections.StarCollection = Backbone.Collection.extend({
  model: starsApp.models.Star
});

starsApp.views.StarView = Backbone.View.extend({
  tagName: 'li',
  events: {'click .close': 'remove'},

  remove: function () {
    this.model.destroy();
  },

  render: function() {
    var templateContents = $('#tmpl_star').html();
    var template = _.template(templateContents);
    this.$el.html(template({star: this.model}));
    return this;
  }
});

starsApp.views.StarCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#add_star': 'addStarFromEvent'},

  initialize: function() {
    this.collection = new starsApp.collections.StarCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  // add an star to this view's Collection:
  add: function(name, luminosity, url) {
        var star = new starsApp.models.Star({name: name, luminosity: luminosity, url: url});
        this.collection.add(star);
  },

  // Add and image from a form to submit event.
  addStarFromEvent: function(ev) {
    ev.preventDefault();
    console.log('addStarFromEvent')
    var $name = $('#name');
    var $luminosity = $('#luminosity');
    var $url = $('#url');
    this.add($name.val(), $luminosity.val(), $url.val());
    $name.val('');
    $luminosity.val('');
    $url.val('');
  },

  // draw a star on the page:
  render: function() {
    var that = this;
    $('#solar_system2').empty();
    this.collection.each(function(el) {
      var starView = new starsApp.views.StarView({model: el});
      $('#solar_system2').append(starView.render().el);
    });

  }

});


// creating a new view:
starsApp.setup = function() {
  var stars = new starsApp.views.StarCollectionView();

  stars.add('The Sun', '3.846', 'http://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/The_Sun_by_the_Atmospheric_Imaging_Assembly_of_NASA%27s_Solar_Dynamics_Observatory_-_20100819.jpg/435px-The_Sun_by_the_Atmospheric_Imaging_Assembly_of_NASA%27s_Solar_Dynamics_Observatory_-_20100819.jpg');
  stars.add('Alpha Centauri', '0.500', 'http://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/The_bright_star_Alpha_Centauri_and_its_surroundings.jpg/450px-The_bright_star_Alpha_Centauri_and_its_surroundings.jpg');
  
  console.log('hello')

};

$(starsApp.setup);