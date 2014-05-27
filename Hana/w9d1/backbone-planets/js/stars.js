var starsApp = starsApp || {
  models: {},
  views: {},
  collections: {}
};

starsApp.models.Star = Backbone.Model.extend({
  defaults: {
    name: "",
    url: "",
    solarsystem: "",
    distance: ""
  }
});

starsApp.collections.StarCollection = Backbone.Collection.extend({
  model: starsApp.models.Star
});

starsApp.views.StarView = Backbone.View.extend({
  tagName: 'li',
  events: {'click .remove': 'remove'},

  remove: function(){
    this.model.destroy();
  },

  render: function(){
    var templateContents = $('#tmpl_star').html();
    var template = _.template(templateContents);
    this.$el.html(template({
      star: this.model
    }));
    return this;
  }
});

starsApp.views.StarCollectionView = Backbone.View.extend({
  el: '#stars_container',
  events: {'submit form#add_star': 'addStarFromEvent'},

  initialize: function(){
    this.collection = new starsApp.collections.StarCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  add: function(name, url, solarsystem, distance){
    var star = new starsApp.models.Star({name: name, url: url, solarsystem: solarsystem, distance: distance});
    this.collection.add(star)
  },

addStarFromEvent: function(ev){
  ev.preventDefault();
  var $name = $('#name');
  var $url = $('#url');
  var $solarsystem = $('#solarsystem');
  var $distance = $('#distance');

  this.add($name.val(), $url.val(), $solarsystem.val(), $distance.val());

  $name.val('');
  $url.val('');
  $solarsystem.val('');
  $distance.val('');
},

render: function(){
  $('#show_stars').empty();
  this.collection.each(
    function(el){
    var starView = new starsApp.views.StarView({
      model: el
    });

    $('#show_stars').append(starView.render().el);
  });
}

});


starsApp.setup = function(){
var stars = new starsApp.views.StarCollectionView();
stars.add('Proxima Centauri', 'http://upload.wikimedia.org/wikipedia/commons/3/30/Mercury_in_color_-_Prockter07_centered.jpg', 'Alpha Centauri', '4.365');
};

$(starsApp.setup);