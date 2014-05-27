var Notes = Notes || {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  setup: function() {}
};

Notes.Models.Note = Backbone.Model.extend({});
Notes.Collections.NoteCollection = Backbone.Collection.extend({
  model: Notes.Models.Note,
  url: '/notes' 
});

Notes.Views.NoteView = Backbone.View.extend({
  tagName: 'div',
  template: _.template($('#tmpl_note').html()),
  render: function() {
    this.$el.html(this.template({ note: this.model}));
    return this;
  }
});

Notes.Views.NoteCollectionView = Backbone.View.extend({
  el: '#container',
  render: function() {
    var that = this;
    this.$el.empty();
    this.collection.each(function(noteModel) {
      var noteView = new Notes.Views.NoteView({ model: noteModel });
      that.$el.append(noteView.render().el);
    });
    return this;
  }
});

// show the form for a new note
Notes.Views.NoteCreationView = Backbone.View.extend({
  el: '#container',
  events: {'click .close' : 'closeNote'},
  template: _.template($('#tmpl_newnote').html()),
  render: function() {
    this.$el.html(this.template());
    return this;
  }
});

Notes.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "showIndex",
    "new": "createNewNote"
  },

  showIndex: function() {
    var collectionView = new Notes.Views.NoteCollectionView({collection: Notes.allNotes});
    collectionView.render();
  },

  createNewNote: function() {
    new Notes.Views.NoteCreationView().render();
  }
});

Notes.setup = function() {
  Notes.router = new Notes.Routers.AppRouter();
  Notes.allNotes = new Notes.Collections.NoteCollection();
  Notes.allNotes.fetch({ success: Notes.router.showIndex });
  Backbone.history.start();
};

$(Notes.setup);

