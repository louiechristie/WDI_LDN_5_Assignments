var Stars = Stars || {
  Models: {},
  Views: {},
  Collections: {},
  Routers: {},
  setup: function() {}
};

Stars.Models.Star = Backbone.Model.extend({});

Stars.Collections.StarCollection = Backbone.Collection.extend({
  model: Stars.Models.Star,
  url: '/stars'
});

Stars.Views.StarView = Backbone.View.extend({
  tagName: 'div',
  className: 'star',
  events: {'click span': 'makeElementEditable',
            'blur input': 'saveChanges',
            'keyup input': 'keyboardSaveChanges',
  },
  template: _.template($('#template_star').html()),

  render: function() {
    this.$el.html(this.template({star: this.model}));
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
  }
});

Stars.Views.StarCollectionView = Backbone.View.extend({
  el: '#stars-container',
  render: function() {
    var that = this;
    this.$el.empty();
    this.collection.each(function(starModel){
      var starView = new Stars.Views.StarView({model: starModel});
      that.$el.append(starView.render().el);
    });
    return this;
  }
});

Stars.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    '': 'showIndex',
    'new': 'createNewStar'
  },

  showIndex: function() {
    new Stars.Views.StarCollectionView({collection: Stars.allStars}).render();
  },

  createNewStar: function() {
    new Stars.Views.StarCreationView().render();
  }
});

Stars.Views.StarCreationView = Backbone.View.extend({
  el: '#stars-container',
  events: {'submit form': 'createNewStar'},
  template: _.template($('#template_newstar').html()),
  render: function() {
    this.$el.html(this.template());
    return this;
  },

  createNewStar: function(ev) {
    ev.preventDefault();
    var name = $('input[name="name"]').val();
    var age = $('input[name="age"]').val();
    var mass = $('input[name="mass"]').val();
    var classification = $('input[name="classification"]').val();
    var luminosity = $('input[name="luminosity"]').val();
    var image = $('input[name="image"]').val();
    var newStar = new Stars.Models.Star({name: name, age: age, mass: mass, classification: classification, luminosity: luminosity, image: image});
    Stars.allStars.add(newStar);
    newStar.save();
    Stars.router.navigate('', {trigger: true});
  }
});

Stars.setup = function() {
  Stars.router = new Stars.Routers.AppRouter();
  Stars.allStars = new Stars.Collections.StarCollection();
  Stars.allStars.fetch({ success: Stars.router.showIndex });
  Backbone.history.start();
};

$(Stars.setup);

