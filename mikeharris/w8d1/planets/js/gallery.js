var galleryApp = galleryApp || {
  models: {},
  views: {},
  collections:{}
}


galleryApp.models.Image = Backbone.Model.extend({
  defaults: {
    title: "",
    url: "",
  }
})

galleryApp.collections.ImageCollection = Backbone.Collection.extend({
  model: galleryApp.models.Image
})


galleryApp.views.ImageView = Backbone.View.extend({
  tagName: 'li',
  render: function() {
    var templateContents = $('#tmpl_image').html();
    var template = _.template(templateContents);
    this.$el.html(template({image: this.model}));
    return this;
  }
});

galleryApp.views.ImageCollectionView = Backbone.View.extend({
  el: '#gallery_images',

  initialize: function(){
    this.collection = new galleryApp.collections.ImageCollection();
    this.collection.bind('add', this.appendItem, this);
    },
  // add an image to this collection  
  add: function(title, url) {
    var image = new galleryApp.models.Image({title: title, url: url});
    this.collection.add(image);
  },

  //draw
  appendItem: function(image){
    var imageView =  new galleryApp.views.ImageView({ model:image});
    this.$el.append(imageView.render().el);
  }
})



galleryApp.setup = function () {
  var appView = new galleryApp.views.AppView();
  var gallery = new galleryApp.views.ImageCollectionView();
  gallery.add("steve z",'http://www.fillmurray.com/200/300');
  gallery.add("Venkmen",'http://www.fillmurray.com/210/310');
  
};

$(galleryApp.setup);

