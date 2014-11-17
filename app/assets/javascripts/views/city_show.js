YelpClone.Views.CityShow = Backbone.View.extend({
  template: JST["cities/show"],

  initialize: function() {
    this.listenTo(this.model, "add change sync", this.render);
    this.listenTo(this.model.businesses(), "add change sync remove", this.render);
    this.listenTo(YelpClone.currentUser, "add change sync remove", this.render);
    this.listenTo(YelpClone.Collections.cities, "add change sync remove", this.render);
  },

  render: function() {
    this.$el.html(this.template({city: this.model}));
    var show = this;
    return this;
  }
});
