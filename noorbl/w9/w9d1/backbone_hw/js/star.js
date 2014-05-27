 // defining the module:
var starApp = starApp || {
  models: {},
  views: {},
  collections: {}
};


addressApp.models.Person = Backbone.Model.extend({
  defaults: {
    name: "",
    mass: "",
    life_cycle: "",
    planets: "",
    url: ""
   }
});



starApp.collections.StarCollection = Backbone.Collection.extend({
  model: starApp.models.Star
});


starApp.views.StarView = Backbone.View.extend({
  tagName: 'li',
  events: { 'click .close': 'remove'},

  remove: function() {
    this.model.destroy();
  },

  render: function() {
    var templateContents = $('#tmpl_star').html();
    var template = _.template(templateContents);
    this.$el.html(template({star: this.model}));
    return this;
  }
});



starApp.views.StarCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#add_star': 'addStarFromEvent'},

  initialize: function() {
    this.collection = new starApp.collections.StarCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  // add an image to this view's Collection:
  add: function(name, mass, life_cycle, planets, url) {
        var star = new starApp.models.Star({name: name, mass: mass, life_cycle: life_cycle, planets: planets, url: url});
        this.collection.add(star);
  },

   addStarFromEvent: function(ev) {
    ev.preventDefault();
    var $name = $('#name');
    var $mass = $('#mass')
    var $life_cycle = $('#life_cycle')
    var $planets = $('#planets')
    var $url = $('#url');
    this.add($name.val(), $mass.val(), $life_cycle.val(), $planets.val(), $url.val());
    $name.val('');
    $mass.val('');
    $life_cycle.val('');
    $planets.val('');
    $url.val('');
  },

  render: function() {
    $('#list_star').empty();
    this.collection.each(function(el) {
      var starView = new starApp.views.StarView({model: el});
      $('#list_star').append(starView.render().el);
    });
  }

});


// creating a new view:
starApp.setup = function() {
  
  var star = new starApp.views.StarCollectionView();
  star.add('http://www.fillmurray.com/200/300');
  star.add('http://www.fillmurray.com/210/310');
  star.add('http://www.placecage.com/g/200/300');
};


$(starApp.setup);