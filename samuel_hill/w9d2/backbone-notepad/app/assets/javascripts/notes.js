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
  events: {'click h2': 'makeHeadlineEditable',
          'blur input': 'saveChanges',
          'keyup input': 'keyboardSaveChanges'
  },
  template: _.template($('#tmpl_note').html()),

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
  },

  render: function() {
    this.$el.html(this.template({ note: this.model}));
    return this;
  },

  makeHeadlineEditable: function(ev) {
    var $target = $(ev.currentTarget);
    var headline = $target.text();
    var newInput = $('<input>');
    newInput.val(headline);
    $target.replaceWith(newInput);
    newInput.focus();
  },

  keyboardSaveChanges: function(ev) {
    if (13 == ev.keyCode) {
      this.saveChanges(ev);
    } else if (27 == ev.keyCode) {
      this.render();
    }
  },

  saveChanges: function(ev) {
    var $target = $(ev.currentTarget);
    var newHeadline = $target.val();
    this.model.set('title', newHeadline);
    this.model.save();
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
  events: {'submit form' : 'createNewNote'},
  template: _.template($('#tmpl_newnote').html()),
  render: function() {
    this.$el.html(this.template());
    return this;
  },

  createNewNote: function(ev) {
    ev.preventDefault();
    var title = $('input[name="title"]').val();
    var body = $('textarea[name="body"]').val();
    var note = new Notes.Models.Note({title: title, body: body});
    Notes.allNotes.add(note);
    note.save();
    Notes.router.navigate("", {trigger: true});
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

