var Notes = Notes || {
  Models: {},
  Collections: {},
  Views: {},
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

Notes.setup = function() {
  var allNotes = new Notes.Collections.NoteCollection();
  allNotes.fetch()
  var collectionView = new Notes.Views.NoteCollectionView({collection: allNotes});
  collectionView.render();
};

$(Notes.setup);

