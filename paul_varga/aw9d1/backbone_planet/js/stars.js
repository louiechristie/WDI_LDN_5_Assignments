var starApp = starApp || {
    models: {},
    views: {},
    collections: {}
};

starApp.models.Star = Backbone.Model.extend({
    defaults: {
        name: "",
        mass: "",
        stage: "",
        planets: ""
    }
});

starApp.collections.StarCollection = Backbone.Collection.extend({
    model: starApp.models.Star
});

starApp.views.StarView = Backbone.View.extend({
    tagName: 'li',
    events: { 'click .remove': 'remove'},

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
    el: '#block',
    events: {'submit form#add_star': 'addStarFromEvent'},

    initialize: function() {
        this.collection = new starApp.collections.StarCollection();
        this.collection.bind('add', this.render, this);
        this.collection.bind('remove', this.render, this);
    },

    // Add a planet to this view's Collections.
    add: function(name, mass, stage, planets) {
        var star = new starApp.models.Star({name: name, mass: mass, stage: stage, planets: planets});
        this.collection.add(star);
    },

    // Add an image from a form submit event.
    addStarFromEvent: function(ev) {
        ev.preventDefault();
        var $name = $('#star_name');
        var $mass = $('#mass');
        var $stage = $('#stage');
        var $planets = $('#planets');
        this.add($name.val(), $mass.val(), $stage.val(), $planets.val());
        $name.val('');
        $mass.val('');
        $stage.val('');
        $planets.val('');
    },

    // Draw an image to the page.
    render: function() {
        $('#stars_list').empty();
        this.collection.each(function(el){
            var starView = new starApp.views.StarView({model: el});
            $('#stars_list').append(starView.render().el);
        });
    }
});

starApp.setup = function() {
    var star = new starApp.views.StarCollectionView();
     star.add('Sun', '1.989×10^30', '4.6 billion years', '9' )
    
    var $select = $("#planets");
    for (i=0;i<=100;i++){
        $select.append($('<option></option>').val(i).html(i))
    }
};

$(starApp.setup);
