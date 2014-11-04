YelpClone.Views.CityShow = Backbone.View.extend({
  template: JST["cities/show"],

  initialize: function() {
    this.listenTo(this.model, "add, change, sync", this.render);
  },

  render: function() {
    this.$el.html(this.template({city: this.model}));
    var show = this;
    return this;
  }
});
