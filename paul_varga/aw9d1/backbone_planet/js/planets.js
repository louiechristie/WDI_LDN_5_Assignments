var planetApp = planetApp || {
    models: {},
    views: {},
    collections: {}
};

planetApp.models.Planet = Backbone.Model.extend({
    defaults: {
        name: "",
        moons: "",
        url: "",
    }
});

planetApp.collections.PlanetCollection = Backbone.Collection.extend({
    model: planetApp.models.Planet
});

planetApp.views.PlanetView = Backbone.View.extend({
    tagName: 'li',
    events: { 'click .close': 'remove'},

    remove: function() {
        this.model.destroy();
    },

    render: function() {
        var templateContents = $('#tmpl_planet').html();
        var template = _.template(templateContents);
        this.$el.html(template({planet: this.model}));
        return this;
    }
});

planetApp.views.PlanetCollectionView = Backbone.View.extend({
    el: '#container',
    events: {'submit form#add_planet': 'addPlanetFromEvent'},

    initialize: function() {
        this.collection = new planetApp.collections.PlanetCollection();
        this.collection.bind('add', this.render, this);
        this.collection.bind('remove', this.render, this);
    },

    // Add a planet to this view's Collections.
    add: function(name, moons, url) {
        var planet = new planetApp.models.Planet({name: name, moons: moons, url: url});
        this.collection.add(planet);
    },

    // Add an image from a form submit event.
    addPlanetFromEvent: function(ev) {
        ev.preventDefault();
        var $name = $('#name');
        var $moons = $('#moons');
        var $url = $('#url');
        this.add($name.val(), $moons.val(), $url.val());
        $name.val('');
        $moons.val('');
        $url.val('');
    },

    // Draw an image to the page.
    render: function() {
        $('#planets_list').empty();
        this.collection.each(function(el){
            var planetView = new planetApp.views.PlanetView({model: el});
            $('#planets_list').append(planetView.render().el);
        });
    }
});

planetApp.setup = function() {
    var planet = new planetApp.views.PlanetCollectionView();
    planet.add('Mercury', '0', 'http://d1jqu7g1y74ds1.cloudfront.net/wp-content/uploads/2008/05/mercury_mariner10-580x542.jpg')
    planet.add('Venus', '0', 'http://d1jqu7g1y74ds1.cloudfront.net/wp-content/uploads/2009/08/venusmagellan-580x580.jpg')
    planet.add('Earth', '1', 'http://d1jqu7g1y74ds1.cloudfront.net/wp-content/uploads/2009/08/messenger_earth_lrg-580x456.jpg')
    planet.add('Mars', '2', 'http://d1jqu7g1y74ds1.cloudfront.net/wp-content/uploads/2009/05/nasa_mars.jpg')

    var $select = $("#moons");
    for (i=0;i<=100;i++){
        $select.append($('<option></option>').val(i).html(i))
    }
};

$(planetApp.setup);


