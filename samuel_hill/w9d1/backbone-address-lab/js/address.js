var addressApp = addressApp || {
  models: {},
  views: {},
  collections: {}
};

addressApp.models.Address = Backbone.Model.extend({
  defaults: {
    first_name: "",
    last_name: "",
    email: "",
    image: ""
  }
});

addressApp.collections.AddressCollection = Backbone.Collection.extend({
  model: addressApp.models.Address
});

addressApp.views.AddressView = Backbone.View.extend({
  tagName: 'li',

  events: {'click .close' : 'remove'},

  remove: function() {
    this.model.destroy();
  },

  render: function() {
    var templateContents = $('#tmpl_address').html();
    var template = _.template(templateContents);
    this.$el.html(template({address: this.model}));
    return this;
  }
})

addressApp.views.AddressCollectionView = Backbone.View.extend({
  el: '#container',
  events: {'submit form#add_address': 'addAddressFromEvent'},

  initialize: function() {
    console.log("SUCCESS!");
    this.collection = new addressApp.collections.AddressCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  // Add an address to this views collections
    add: function(first_name, last_name, email, image) {
      var address = new addressApp.models.Address({first_name: first_name, last_name: last_name, email: email, image: image});
      this.collection.add(address);
    },

     // add an image from form submission
    addAddressFromEvent: function(ev) {
      ev.preventDefault();
      var $firstname = $('#first-name');
      var $lastname = $('#last-name');
      var $email = $('#email');
      var $url = $('#url');
      this.add($firstname.val(), $lastname.val(), $email.val(), $url.val());
      $firstname.val('');
      $lastname.val('');
      $email.val('');
      $url.val('');
    },

    // Draw an address on the page
    render: function() {
      $('#address_container').empty();
      this.collection.each(function(el) {
        var addressView = new addressApp.views.AddressView({model: el});
        $('#address_container').append(addressView.render().el);
      });
    }

});

addressApp.setup = function() {

  var addressBook = new addressApp.views.AddressCollectionView();
  addressBook.add('Steve', 'Zizzou', 'szizzou@example.com', 'http://37.media.tumblr.com/4812963e7ae93db2245014f3fa1194c4/tumblr_mk9rs3Mmjh1s7aky5o2_r1_1280.jpg');
  addressBook.add('Samuel', 'Hill', 'samuel@example.com', 'http://37.media.tumblr.com/83774c7076b2b449aba4eb33bd2253c5/tumblr_mleb5oUjI51s7aky5o2_r1_1280.jpg');
  addressBook.add('Gary', 'Brown', 'gary@example.com', 'http://37.media.tumblr.com/3f521ec4df88886a92a26a0895c03d28/tumblr_n38som3Ljz1s7aky5o1_1280.jpg');
  addressBook.add('Steve', 'Smith', 'steve@example.com', 'http://24.media.tumblr.com/7bd18a20474763993b033dfd1076642c/tumblr_mxedyzB5DB1s7aky5o1_1280.jpg');
  addressBook.add('Linda', 'Oldfield', 'linda@example.com', 'http://24.media.tumblr.com/96c147c8ebe8facd5f573db0b9565a0d/tumblr_mpjfsbrBhS1s7aky5o1_1280.jpg');
  addressBook.add('Thomas', 'Drew', 'thomas@example.com', 'http://31.media.tumblr.com/47b1394ff542cddc94f445971b12a1c9/tumblr_mn4313jQwn1s7aky5o1_1280.jpg');
  };

$(addressApp.setup);








