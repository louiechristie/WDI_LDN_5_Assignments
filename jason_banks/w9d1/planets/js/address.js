var addressApp = addressApp || {
  models: {},
  views: {},
  collections: {}
};

addressApp.models.Address = Backbone.Model.extend({
    defaults: {
      first_name: '',
      last_name: '',
      email: '',
      image: '',
    }
});

addressApp.collections.AddressCollection = Backbone.Collection.extend({
  model: addressApp.models.Address
});

addressApp.views.AddressView = Backbone.View.extend({
  tagName: 'li',
  events: {'click span': 'remove'},
  remove: function() {
    this.model.destroy();
  },
  render: function(){
    var templateContents = $('#tmpl_address').html();
    var template = _.template(templateContents);
    this.$el.html(template({address: this.model}));
    return this;
  }
})

addressApp.views.AddressCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#address_form': 'addAddressFromForm'},

  initialize: function() {
    console.log("This is the initializing function.");
    this.collection = new addressApp.collections.AddressCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  add: function(first_name, last_name, email, image){
    var address = new addressApp.models.Address({first_name: first_name, last_name: last_name, email: email, image: image});
    this.collection.add(address);
  },

  addAddressFromForm: function(ev) {
    ev.preventDefault();
    var $first_name = $('#first_name');
    var $last_name = $('#last_name');
    var $email = $('#email');
    var $image = $('#image');
    this.add($first_name.val(), $last_name.val(), $email.val(), $image.val());
    $first_name.val('');
    $last_name.val('');
    $email.val('');
    $image.val('');
  },

  render: function(){
    $('#address_container').empty();
    this.collection.each(function(el){
      var addressView = new addressApp.views.AddressView({ model: el});
      $('#address_container').append(addressView.render().el);
    });
  }
})

addressApp.setup = function() {
  var addressBook = new addressApp.views.AddressCollectionView();
  addressBook.add('Steve', 'Zissou', 'szissou@lifeqauatic.com', 'http://37.media.tumblr.com/3f521ec4df88886a92a26a0895c03d28/tumblr_n38som3Ljz1s7aky5o1_1280.jpg');
  addressBook.add('Mary', 'Tyler Moore', 'mtylermoore@tvland.com', 'http://37.media.tumblr.com/77ea19355786597f3f967c72f8ba0c6d/tumblr_n09td4gc9Q1s7aky5o1_1280.jpg');
}

$(addressApp.setup);